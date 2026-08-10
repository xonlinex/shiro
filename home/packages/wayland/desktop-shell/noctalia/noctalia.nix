{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      backdrop = {
        enabled = true;
      };

      bar = {
        order = [ "default" ];

        default = {
          font_family = "Outfit";
          font_weight = 400;
          background_opacity = 0.85;
          capsule = true;
          capsule_fill = "primary";
          capsule_opacity = 0.15;
          capsule_padding = 10.0;
          capsule_radius = 20;
          capsule_thickness = 0.8;
          thickness = 40;
          padding = 10;
          position = "top";
          radius = 20;
          margin_ends = 0;
          widget_spacing = 5;

          start = [ "launcher" "workspaces" "taskbar" "active_window" ];
          center = [ "media" ];
          end = [
            "tray"
            "keyboard_layout"
            "privacy"
            "sysmon"
            "group:g1"
            "clock"
            "weather"
            "volume"
            "notifications"
            "control-center"
          ];

          capsule_group = [
            {
              id = "g1";
              enabled = true;
              fill = "primary";
              members = [ "cpu" "ram" "sysmon" ];
              opacity = 0.15;
              padding = 10.0;
              radius = 20.0;
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

      dock = {
        enabled = true;
        background_opacity = 0.7;
        cross_axis_padding = 10;
        icon_size = 40;
        inactive_opacity = 1.0;
        inactive_scale = 1.0;
        item_spacing = 5;
        magnification = true;
        main_axis_padding = 10;
        margin_edge = 10;
        pinned = [ "zen-beta" "com.mitchellh.ghostty" "org.gnome.Nautilus" "mpv" "com.github.neithern.g4music" "org.gnome.Loupe" "org.gnome.Papers" "vesktop" "DBeaver" "Postman" "nvim.desktop"];
        radius = 16;
        show_dots = true;
      };

      hooks = {
        colors_changed = "~/.config/noctalia/toggle-theme.sh";
      };

      location = {
        auto_locate = true;
      };

      nightlight = {
        enabled = true;
      };

      osd = {
        background_opacity = 0.8;
        offset_x = 0;
        offset_y = 15;
      };

      plugins = {
        enabled = [ ];
      };

      shell = {
        avatar_path = "/home/xonlinex/Pictures/elaine-dev.png";
        font_family = "Outfit";
        screen_corners = {
            enabled = true;
            size = 40;
        };
        shadow = {
          direction = "center";
        };
      };

      theme = {
        mode = "auto";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";
        templates = {
          builtin_ids = [ "cava" "gtk3" "gtk4" "niri"];
          community_ids = [ "discord" "vicinae" "zen-browser" ];
        };
      };

      wallpaper = {
        default = {
          path = "/home/xonlinex/Pictures/Wallpapers/dyE8BgjS-wallha.com.jpg";
        };
        last = {
          path = "/home/xonlinex/Pictures/Wallpapers/dyE8BgjS-wallha.com.jpg";
        };
        monitors = {
          "HDMI-A-2" = {
            path = "/home/xonlinex/Pictures/Wallpapers/dyE8BgjS-wallha.com.jpg";
          };
        };
      };

      widget = {
        active_window = {
          display = "text_only";
        };
        clock = {
          format = " {:%d %b, %H:%M}";
        };
        control-center = {
          capsule = true;
          capsule_padding = 2;
          custom_image = "/home/xonlinex/Pictures/elaine-dev-rounded.png";
          scale = 1.6;
        };
        cpu = {
          display = "text";
          stat = "disk_used_pct";
        };
        launcher = {
          capsule = true;
          capsule_padding = 5;
          custom_image = "/home/xonlinex/Pictures/nixos.png";
          scale = 1.25;
        };
        media = {
          max_length = 300;
          title_scroll = "always";
        };
        privacy = {
          hide_inactive = true;
        };
        ram = {
          display = "text";
        };
        sysmon = {
          display = "text";
          stat = "disk_used";
        };
        taskbar = {
          inactive_opacity = 0.7;
          only_active_workspace = true;
          show_active_indicator = false;
        };
        workspaces = {
          active_pill_size = 2.0;
          empty_color = "secondary";
        };
      };
    };
  };
}
