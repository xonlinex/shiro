{ inputs, ... }:

{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;

    settings = {
      # INCLUDES
      include = {
        optional.files = [
          "noctalia.toml"
        ];
      };

      general = {
        autostart = [ "vicinae server" ];
        mod_key = "Super";
        show_cheatsheet = false;
      };

      colors = {
        backdrop = "#000000";
        border = {

          # focused = "#F7DCDE39";
          # unfocused = "#A58A8D30";
        };
      };

      appearance = {
        prefer_no_csd = true;
        border_width = 2;
        outer_border_width = 0;
        corner_radius = 10;

        blur = {
          enabled = true;
          optimized = false;
          passes = 4;
          noise = 0.04;
          saturation = 1.0;
        };
        shadow = {
          enabled = false;
          softness = 30;
          offset_x = 0;
          offset_y = 0;
        };
      };

      overview = {
        background_blur = true;
        zoom = 0.60;
      };

      # INPUT
      input = {
        keyboard = {
          layout = "us,es";
          options = "grp:win_space_toggle"; # super+space
          numlock_toggle = true;
          repeat_rate = 30;
          repeat_delay = 200;
        };

        mouse = {
          accel_profile = "flat";
          sensitivity = 0.0;
        };

        cursor = {
          theme = "macOS";
          size = 24;
          follows_focus = false;
          hide_when_typing = true;
          hide_timeout_ms = 5000;
        };

        drag_edge_scroll = {
          enabled = true;
          trigger_zone = 30;
          delay_ms = 100;
          max_speed = 1500.0;
        };
      };

      # KEYBINDS
      keybinds = {
        # Vicinae
        "Mod+V" = {
          action = "spawn vicinae deeplink vicinae://launch/clipboard/history";
          repeat = false;
        };
        "Mod+Slash" = {
          action = "spawn vicinae deeplink vicinae://launch/files/search";
          repeat = false;
        };

        # Applications and session
        "Mod+Return" = {
          action = "spawn ghostty";
          repeat = false;
        };
        "Mod+E" = {
          action = "spawn luciole";
          repeat = false;
        };
        "Mod+Q" = {
          action = "window-close";
          repeat = false;
        };

        # Layouts: dwindle
        "Mod+U" = "workspace-next";
        "Mod+I" = "workspace-previous";
        "Mod+WheelDown" = "workspace-next";
        "Mod+WheelUp" = "workspace-previous";
        "Mod+Shift+O" = "layout-toggle-split";

        # Layouts: scrolling
        "Mod+C" = "column-center";
        "Mod+Shift+WheelUp" = "window-focus-left";
        "Mod+Shift+WheelDown" = "window-focus-right";
        "Mod+R" = "window-cycle-primary-extent";
        "Mod+Shift+R" = "window-cycle-primary-extent-back";
        "Mod+M" = {
          action = "window-toggle-maximize";
          repeat = false;
        };
        "Mod+W" = {
          action = "column-toggle-tabbed";
          repeat = false;
        };

        # Layouts: floating
        "Mod+S" = {
          action = "window-toggle-floating";
          repeat = false;
        };
        "Mod+Shift+C" = "window-center";

        # General
        "Mod+Tab" = "workspace-focus-last";
        "Alt+Tab" = "spawn noctalia msg window-switcher hold";
        "Alt+Escape" = "spawn noctalia msg window-switcher current";

        # Focus
        "Mod+H" = "window-focus-left";
        "Mod+J" = "window-focus-down";
        "Mod+K" = "window-focus-up";
        "Mod+L" = "window-focus-right";

        # Move window
        "Mod+Shift+H" = "column-move-left";
        "Mod+Shift+J" = "window-move-down";
        "Mod+Shift+K" = "window-move-up";
        "Mod+Shift+L" = "column-move-right";

        # Resize window
        "Mod+Minus" = "window-modify-primary-extent -0.05";
        "Mod+Equal" = "window-modify-primary-extent 0.05";
        "Mod+Shift+Minus" = "window-modify-secondary-extent -0.05";
        "Mod+Shift+Equal" = "window-modify-secondary-extent 0.05";

        # Pinned window
        "Mod+P" = {
          action = "window-toggle-pinned";
          repeat = false;
        };

        # Fullscreen
        "Mod+F" = {
          action = "window-toggle-maximize-to-edges";
          repeat = false;
        };
        "Mod+Shift+F" = {
          action = "window-toggle-fullscreen";
          repeat = false;
        };
        "Mod+O" = {
          action = "overview-toggle";
          repeat = false;
        };

        # Workspaces
        "Mod+1" = "workspace-switch 1";
        "Mod+2" = "workspace-switch 2";
        "Mod+3" = "workspace-switch 3";
        "Mod+4" = "workspace-switch 4";
        "Mod+5" = "workspace-switch 5";
        "Mod+6" = "workspace-switch 6";
        "Mod+7" = "workspace-switch 7";
        "Mod+8" = "workspace-switch 8";
        "Mod+9" = "workspace-switch 9";

        "Mod+Shift+1" = "window-move-to-workspace 1";
        "Mod+Shift+2" = "window-move-to-workspace 2";
        "Mod+Shift+3" = "window-move-to-workspace 3";
        "Mod+Shift+4" = "window-move-to-workspace 4";
        "Mod+Shift+5" = "window-move-to-workspace 5";
        "Mod+Shift+6" = "window-move-to-workspace 6";
        "Mod+Shift+7" = "window-move-to-workspace 7";
        "Mod+Shift+8" = "window-move-to-workspace 8";
        "Mod+Shift+9" = "window-move-to-workspace 9";
      };

      # LAYOUT
      layout = {
        mode = "scrolling"; # "scrolling", "dwindle", "master", or "stacking"
        extent_presets = [
          0.333
          0.5
          0.667
        ];
        gap = 10;

        scrolling = {
          default_extent_fraction = 0.5;
        };
      };

      # HOT CORNERS
      hot_corners.top_left = {
        enabled = true;
        delay_ms = 100;
        action = "overview-open";
      };

      animation = {
        layers = {
          enabled = true;
          duration_ms = 200;
          curve = "easeout";
        };
      };

      window_rule = [
        {
          blur = true;
        }
        {
          match = {
            title = ".*Picture-in-Picture.*";
          };
          title_bar = "off";
          default_floating = true;
        }
        {
          match.app_id = "dev.noctalia.UmbrielSharePicker";
          default_floating = true;
        }
        {
          match.app_id = "org.gnome.Decibels";
          default_floating = true;
        }
      ];

      layer_rule = [
        {
          match.namespace = "^vicinae$";
          dim_behind = 0.2;
          blur = true;
          # blur_popups = true;
          blur_ignore_alpha = 0.1;
          # blur_optimized = false;
        }
      ];
    };
  };
}
