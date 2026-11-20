{ inputs, vars, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    # custom theme
    ./themes/ember.nix
  ];

  programs.noctalia = {
    enable = true;

    settings = {

      audio = {
        enable_sounds = false; # FIX: audio_visualizer conflict
      };

      bar = {
        order = [ "default" ];

        default = {
          font_family = "SF Pro Display";
          font_weight = 400;
          background_opacity = vars.opacity;
          capsule = true;
          capsule_fill = "primary";
          capsule_opacity = vars.capsule-opacity;
          capsule_padding = 10.0;
          capsule_radius = vars.rounding;
          capsule_thickness = 0.7;
          thickness = 50;
          margin_edge = 10;
          margin_ends = 200;
          padding = 10.0;
          position = "top";
          radius = vars.rounding;
          shadow = vars.shadow-status;
          widget_spacing = 5.0;
          start = [
            "launcher"
            "workspaces"
            "taskbar"
            "active_window"
          ];
          center = [ "clock" ];
          # center = [ "clock" "group:g2" ];
          end = [
            "media"
            "tray"
            "keyboard_layout"
            "privacy"
            "group:g1"
            "volume"
            "notifications"
            "control-center"
          ];
          capsule_group = [
            {
              id = "g1";
              enabled = true;
              fill = "primary";
              members = [
                "cpu"
                "ram"
                "sysmon"
              ];
              opacity = vars.capsule-opacity;
              padding = 12.0;
              radius = vars.rounding;
            }
            {
              id = "g2";
              enabled = true;
              fill = "primary";
              members = [
                "audio_visualizer"
                "media"
                "audio_visualizer"
              ];
              opacity = vars.capsule-opacity;
              padding = 7.0;
              radius = vars.rounding;
            }
          ];
        };
      };

      control_center = {
        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "caffeine"; }
          { type = "nightlight"; }
          { type = "dark_mode"; }
          { type = "power_profile"; }
        ];
      };

      keybinds = {
        down = [
          "Down"
          "Ctrl+n"
        ];
        up = [
          "Up"
          "Ctrl+p"
        ];
      };

      hooks = {
        wallpaper_changed = "~/.config/noctalia/save-wallpaper-mode.sh";
        theme_mode_changed = "~/.config/noctalia/wallpaper-sync.sh";
      };

      location = {
        auto_locate = true;
      };

      nightlight = {
        enabled = true;
      };

      notification = {
        background_opacity = vars.opacity;
        max_visible = 3;
        width = 320;
        offset_y = 20;
        offset_x = 20;
        position = "top_right";
      };

      osd = {
        background_opacity = vars.opacity;
        offset_x = 20;
        offset_y = 20;
        # orientation = "vertical";
        position = "bottom_center";
        position_vertical = "center_right";
      };

      shell = {
        app_icon_color = "secondary";
        avatar_path = vars.pfp;
        # corner_radius_scale = 0.0; # square border
        font_family = "SF Pro Display";
        show_close_buttons = true;

        launcher = {
          auto_paste = "off";
          default_view = "all";
        };

        panel = {
          control_center_placement = "attached";
          control_center_position = "auto";
          open_near_click_control_center = true;
          shadow = vars.shadow-status;
          launcher_position = "center";
          session_placement = "floating"; # floating, attached
          session_position = "top_center";
          transparency_mode = "glass"; # glass, solid
          wallpaper_placement = "floating";
          wallpaper_position = "bottom_center";
        };
        screen_corners = {
          enabled = true;
          size = vars.rounding * 2;
        };
        screenshot = {
          directory = "${vars.home-path}/Pictures/Screenshots";
        };
        shadow = {
          direction = "center";
        };
      };

      theme = {
        mode = "dark";
        source = "wallpaper"; # custom, wallpaper
        wallpaper_scheme = "m3-content";
        # custom_palette = "ember";
        templates = {
          builtin_ids = [
            "gtk3"
            "gtk4"
            "umbriel"
            "luciole"
          ];
          community_ids = [
            "discord"
            "vicinae"
            "zen-browser"
            "sonora"
          ];
        };
      };

      wallpaper = {
        directory = "${vars.home-path}/Pictures/Wallpapers";
        transition = [
          "disc"
          "honeycomb"
          "stripes"
        ];
        transition_on_startup = true;
      };

      window_switcher = {
        style = "carousel";
      };

      widget = {
        active_window = {
          display = "text_only";
          max_length = 300;
          min_length = 0;
        };
        audio_visualizer = {
          bands = 3;
          color_2 = "secondary";
          interactive = false;
          mirrored = true;
          width = 20;
        };
        clock = {
          capsule = true;
          format = "{:%I:%M %p} - {:%a %d %b}";
        };
        control-center = {
          capsule = true;
          capsule_padding = 2;
          capsule_fill = "primary";
          capsule_radius = vars.rounding / 2;
          custom_image = vars.pfp;
          scale = 1.8;
        };
        cpu = {
          display = "text";
          stat = "cpu_usage";
          visualization = "none"; # graph, none
          show_value = true;
        };
        launcher = {
          # capsule = true;
          # capsule_padding = 7;
          # capsule_radius = vars.rounding;
          # scale = 1.0;
          color = "primary";
          glyph = "virus";
        };
        media = {
          # art_size = 35;
          # scale = 1.5;
          # capsule = true;
          # capsule_padding = 4;
          hide_when_no_media = true;
          rotate_album_art = true;
          max_length = 200;
          title_scroll = "always";
          actions = {
            scroll_up = "media previous";
            scroll_down = "media next";
          };
        };
        privacy = {
          hide_inactive = true;
        };
        ram = {
          display = "text";
          visualization = "none"; # graph, none
          show_value = true;
        };
        sysmon = {
          stat = "disk_used";
          visualization = "none"; # graph, none
          show_value = true;
        };
        taskbar = {
          inactive_opacity = 0.7;
          only_active_workspace = true;
          show_active_indicator = false;
          scale = 1.0;
        };
        workspaces = {
          active_pill_size = 2.5;
          # capsule = true;
          # capsule_padding = 12;
          # empty_color = "secondary";
          # pill_scale = 0.6;
          show_labels = true;
          style = "regular"; # regular, minimal
        };
      };
    };
  };
}
