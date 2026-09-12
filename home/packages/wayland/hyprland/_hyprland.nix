{ pkgs, lib, inputs, ... }:

let
  lua = lib.generators.mkLuaInline;

  # Helper para binds de teclado estándar
  bind = key: action: {
    _args = [
      key
      (lua action)
    ];
  };

  # Helper para binds de ratón (pasa la tabla de flags { mouse = true })
  bindm = key: action: {
    _args = [
      key
      (lua action)
      (lua "{ mouse = true }")
    ];
  };
    # Helper genérico para binds con flags custom (release, transparent, repeat, etc.)
  bindFlags = flags: key: action: {
    _args = [
      key
      (lua action)
      (lua flags)
    ];
  };
    # Helper para curvas bezier: hl.curve(nombre, { type = "bezier", points = {...} })
  curveDef = name: coords: {
    _args = [
      name
      (lua ''{ type = "bezier", points = { {${toString (builtins.elemAt coords 0)}, ${toString (builtins.elemAt coords 1)}}, {${toString (builtins.elemAt coords 2)}, ${toString (builtins.elemAt coords 3)}} } }'')
    ];
  };

  # Helper para animaciones: hl.animation({ leaf = ..., enabled = true, speed = ..., bezier = ..., style = ... })
  anim = { leaf, speed, curve, style ? null }: {
    _args = [
      (lua ''{ leaf = "${leaf}", enabled = true, speed = ${toString speed}, bezier = "${curve}"${lib.optionalString (style != null) '', style = "${style}"''} }'')
    ];
  };

  # Helper para Autostart en Lua
  on = event: body: {
    _args = [
      event
      (lua ''function() ${body} end'')
    ];
  };
    # Helper para monitores: hl.monitor({ output = ..., mode = ..., position = ..., scale = ... })
  monitorDef = { output ? "", mode, position ? "auto", scale ? 1 }: {
    _args = [
      (lua ''{ output = "${output}", mode = "${mode}", position = "${position}", scale = ${toString scale} }'')
    ];
  };

  # Helper para layer rules: hl.layer_rule({ name = ..., match = {...}, blur = ..., ... })
  layerRule = { name ? null, namespace, blur ? null, ignore_alpha ? null, animation ? null, no_anim ? null }:
    let
      parts = lib.filter (x: x != null) [
        (lib.optionalString (name != null) ''name = "${name}"'')
        ''match = { namespace = "${namespace}" }''
        (lib.optionalString (blur != null) "blur = ${if blur then "true" else "false"}")
        (lib.optionalString (ignore_alpha != null) "ignore_alpha = ${toString ignore_alpha}")
        (lib.optionalString (animation != null) ''animation = "${animation}"'')
        (lib.optionalString (no_anim != null) "no_anim = ${if no_anim then "true" else "false"}")
      ];
      cleanParts = builtins.filter (s: s != "") parts;
    in {
      _args = [ (lua "{ ${lib.concatStringsSep ", " cleanParts} }") ];
    };

  # Dispatchers de Lua
  dspExec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
  exec = cmd: ''hl.exec_cmd("${cmd}")'';
  mvws = ws: ''hl.dsp.focus({ workspace = "${toString ws}" })'';
  mvwd = ws: ''hl.dsp.window.move({ workspace = "${toString ws}" })'';
  focusDir = dir: ''hl.dsp.focus({ direction = "${dir}" })'';
  swapDir = dir: ''hl.dsp.window.swap({ direction = "${dir}" })'';
    resizeActive = x: y: ''hl.dsp.window.resize({ x = ${toString x}, y = ${toString y}, relative = true })'';

  # Generador de atajos de Workspaces (1 al 9)
  workspaceBinds = lib.concatMap (i:
    let ws = toString i;
    in [
      (bind "SUPER + ${ws}" (mvws ws))
      (bind "SUPER + SHIFT + ${ws}" (mvwd ws))
    ]
  ) (lib.range 1 9);
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    plugins = [
      pkgs.hyprlandPlugins.borders-plus-plus
    ];

    extraConfig = ''
      local theme_ok, noctalia = pcall(require, "noctalia")
      if theme_ok and noctalia.apply_theme then
          noctalia.apply_theme()
      end

      -- Registrar configuraciones de plugin via API runtime para evitar errores de schema
-- Asignación nativa de opciones de plugin mediante la API Lua de Hyprland
      hl.config({
        ["plugin:borders-plus-plus:add_borders"] = 1,
        ["plugin:borders-plus-plus:col.border_1"] = "rgb(ffffff)",
        ["plugin:borders-plus-plus:border_size_1"] = 10,
        ["plugin:borders-plus-plus:col.border_2"] = "rgb(222222)",
        ["plugin:borders-plus-plus:border_size_2"] = 10,
        ["plugin:borders-plus-plus:natural_rounding"] = true,
      })
    '';


    settings = {
      monitor = [
        (monitorDef { mode = "highrr"; })
      ];

      on = [
        (on "hyprland.start" ''
          ${exec "vicinae server"}
          ${exec "wl-clip-persist --clipboard both"}
          ${exec "wl-paste --type text --watch cliphist store"}
          ${exec "wl-paste --type image --watch cliphist store"}
          ${exec "noctalia"}
        '')
      ];

      # Concatenamos todos los binds
      bind = [
        # Zoom / Lupa de pantalla (Press: 2x, Release: 1x)
        # Zoom del cursor: SUPER+Z mantiene el zoom mientras está presionado
        (bind "SUPER + Z" (dspExec ''hyprctl eval 'hl.config({ cursor = { zoom_factor = 2 } })' ''))
        (bindFlags "{ release = true, transparent = true }" "SUPER + Z"
          (dspExec ''hyprctl eval 'hl.config({ cursor = { zoom_factor = 1 } })' ''))
        # Workspaces y Navegación
        (bind "SUPER + TAB" "hl.dsp.focus({ workspace = \"previous\" })") # Workspace anterior ($mainMod, TAB)

        # Resize windows
        (bind "SUPER + MINUS" (resizeActive (-40) 0))
        (bind "SUPER + EQUAL" (resizeActive 40 0))
        (bind "SUPER + SHIFT + MINUS" (resizeActive 0 (-40)))
        (bind "SUPER + SHIFT + EQUAL" (resizeActive 0 40))

         # Scroll/bracket navigation (workspace relativo al monitor actual)
        (bind "SUPER + mouse_down" (mvws "m-1"))
        (bind "SUPER + mouse_up" (mvws "m+1"))
        (bind "SUPER + U" (mvws "m-1"))
        (bind "SUPER + I" (mvws "m+1"))
        (bind "SUPER + BRACKETLEFT" (mvws "m-1"))
        (bind "SUPER + BRACKETRIGHT" (mvws "m+1"))

        # Window floating
        (bind "SUPER + S" "hl.dsp.window.float({ action = \"toggle\" })")
        (bind "SUPER + T" "hl.dsp.window.pseudo()")
        (bind "SUPER + M" "hl.dsp.window.fullscreen({ mode = \"maximized\" })") # Fullscreen 1 / Maximizar ($mainMod, M)
        # Lo que no se pudo
        # bind = $mainMod, O, togglesplit
        # bind = $mainMod, C, cyclenext


        (bind "SUPER + F" "hl.dsp.window.fullscreen({ mode = \"maximized\" })") # Fullscreen 1 / Maximizar ($mainMod, M)
        (bind "SUPER + SHIFT + F" "hl.dsp.window.fullscreen({ mode = \"fullscreen\" })") # Fullscreen 0 / Pantalla Completa ($mainMod + SHIFT, F)
        # me olvide que hace esto
        # (bind "SUPER + O" "hl.dsp.layout(\"togglesplit\")") # Toggle Split ($mainMod, O)
        #

        # Navegación tipo Vim (H, J, K, L)
        (bind "SUPER + H" (focusDir "left"))
        (bind "SUPER + J" (focusDir "down"))
        (bind "SUPER + K" (focusDir "up"))
        (bind "SUPER + L" (focusDir "right"))

        # Mover ventanas tipo Vim (Swap)
        (bind "SUPER + SHIFT + H" (swapDir "left"))
        (bind "SUPER + SHIFT + J" (swapDir "down"))
        (bind "SUPER + SHIFT + K" (swapDir "up"))
        (bind "SUPER + SHIFT + L" (swapDir "right"))

        # Sistema / Terminal
        (bind "SUPER + RETURN" (dspExec "kitty"))
        (bind "SUPER + E" (dspExec "kitty -e yazi"))
        (bind "SUPER + Q" "hl.dsp.window.close()")
        # (bind "SUPER + ALT + " "hl.dsp.exit()")

        # Move & Resize
        (bindm "SUPER + mouse:272" "hl.dsp.window.drag()")
        (bindm "SUPER + mouse:273" "hl.dsp.window.resize()")

        # FIX: add more screenshot options
        # Region screenshot (hyprshot)
        (bind "SUPER + SHIFT + S" (dspExec "hyprshot -m region -o ~/Pictures/Screenshots"))

        # FIX: notify with color hex
        (bind "SUPER + P" (dspExec "hyprpicker -a"))

        ### VICINAE ###
        (bind "ALT + SPACE" (dspExec "vicinae toggle"))
        (bind "SUPER + PERIOD" (dspExec "vicinae deeplink vicinae://launch/core/search-emojis"))
        (bind "SUPER + V" (dspExec "vicinae deeplink vicinae://launch/clipboard/history"))
        (bind "SUPER + SLASH" (dspExec "vicinae deeplink vicinae://launch/files/search"))

        ### NOCTALIA ###

        # Keybinds
        (bind "SUPER + D" (dspExec "noctalia msg dock-toggle"))
        (bind "SUPER + B" (dspExec "noctalia msg bar-toggle"))
        (bind "SUPER + SHIFT + Q" (dspExec "noctalia msg panel-toggle session"))
        (bind "SUPER + SHIFT + I" (dspExec "noctalia msg settings-toggle"))
        (bind "SUPER + SHIFT + W" (dspExec "noctalia msg panel-toggle wallpaper"))
        (bind "SUPER + ALT + L" (dspExec "noctalia msg session lock"))
        (bind "CTRL + SHIFT + Escape" (dspExec "noctalia msg panel-open control-center system"))

        # Multimedia & Volume
        (bind "F12" (dspExec "noctalia msg volume-up"))
        (bind "F11" (dspExec "noctalia msg volume-down"))
        (bind "F10" (dspExec "noctalia msg volume-mute"))
        (bind "F9" (dspExec "noctalia msg media next"))
        (bind "F8" (dspExec "noctalia msg media toggle"))
        (bind "F7" (dspExec "noctalia msg media previous"))

      ] ++ workspaceBinds;

      config = {
        animations.enabled = true; # equivalente a "animations { enabled = true }"

        general = {
          gaps_in = 10;
          gaps_out = 20;
          border_size = 2;

          # "col.active_border" = "rgba(F7DCDE39)";
          "col.inactive_border" = "rgba(A58A8D30)";

          resize_on_border = true;
          allow_tearing = true;
          layout = "dwindle";

          snap = {
            enabled = true;
            window_gap = 4;
            monitor_gap = 5;
            respect_gaps = true;
          };
        };

        decoration = {
          rounding = 0;

          shadow = {
            enabled = false;
            range = 30;
            render_power = 5;
            color = "rgba(00000070)";
          };

          blur = {
            enabled = false;
            xray = false;
            size = 14;
            passes = 3;
            popups = true;
            # special = false;
            # new_optimizations = true;
            # brightness = 1.0;
            # noise = 0.01;
            # contrast = 1.0;
            # vibrancy = 0.2;
            # vibrancy_darkness = 0.0;
            # popups_ignorealpha = 0.2;
            # input_methods = true;
            # input_methods_ignorealpha = 0.8;
          };
        };

        input = {
          kb_layout = "us,es";
          kb_options = "grp:win_space_toggle"; # Change layout keyboard (Super+Space)

          follow_mouse = 1;
          force_no_accel = true;

          repeat_delay = 250;
          repeat_rate = 35;
        };

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };

        dwindle = {
          preserve_split = true;
          smart_split = false;
          smart_resizing = false;
          force_split = 2;
        };
      };

      curve = [
        (curveDef "expressiveFastSpatial"    [ 0.42 1.67 0.21 0.90 ])
        (curveDef "expressiveSlowSpatial"    [ 0.39 1.29 0.35 0.98 ])
        (curveDef "expressiveDefaultSpatial" [ 0.38 1.21 0.22 1.00 ])
        (curveDef "emphasizedDecel"          [ 0.05 0.7  0.1  1    ])
        (curveDef "emphasizedAccel"          [ 0.3  0    0.8  0.15 ])
        (curveDef "standardDecel"            [ 0    0    0    1    ])
        (curveDef "menu_decel"               [ 0.1  1    0    1    ])
        (curveDef "menu_accel"               [ 0.52 0.03 0.72 0.08 ])
        (curveDef "stall"                    [ 1    (-0.1) 0.7 0.85 ])
      ];

      animation = [
        # windows
        (anim { leaf = "windowsIn";  speed = 3;  curve = "emphasizedDecel"; style = "popin 80%"; })
        (anim { leaf = "fadeIn";     speed = 3;  curve = "emphasizedDecel"; })
        (anim { leaf = "windowsOut"; speed = 2;  curve = "emphasizedDecel"; style = "popin 90%"; })
        (anim { leaf = "fadeOut";    speed = 2;  curve = "emphasizedDecel"; })
        (anim { leaf = "windowsMove"; speed = 3; curve = "emphasizedDecel"; style = "slide"; })
        (anim { leaf = "border";     speed = 10; curve = "emphasizedDecel"; })

        # layers
        (anim { leaf = "layersIn";  speed = 2.7; curve = "emphasizedDecel"; style = "popin 93%"; })
        (anim { leaf = "layersOut"; speed = 2.4; curve = "menu_accel";      style = "popin 94%"; })

        # fade
        (anim { leaf = "fadeLayersIn";  speed = 0.5; curve = "menu_decel"; })
        (anim { leaf = "fadeLayersOut"; speed = 2.7; curve = "stall"; })

        # workspaces
        (anim { leaf = "workspaces"; speed = 7; curve = "menu_decel"; style = "slidevert"; })

        # specialWorkspace
        (anim { leaf = "specialWorkspaceIn";  speed = 2.8; curve = "emphasizedDecel"; style = "slidevert"; })
        (anim { leaf = "specialWorkspaceOut"; speed = 1.2; curve = "emphasizedAccel"; style = "slidevert"; })
      ];

      layer_rule = [
        (layerRule {
          name = "anim-vicinae";
          namespace = "vicinae";
          blur = true;
          ignore_alpha = 0.0;
          animation = "slide top";
        })
      ];
    };
  };
}
