{ inputs, ... }:

{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;

    # Serialized to ~/.config/umbriel/config.toml
    settings = {
      # INCLUDES
      include = {};

      general.mod_key = "Super";

      output."HDMI-A-2" = {
        mode = "2560x1440@144";
        min_workspaces = 6;
        cyclic_workspaces = false;
      };

      workspace = [
        {
          index = 2;
          # layout.mode = "dwindle";
          layout.struts = {
            left = 400;
            right = 400;
            top = 100;
            bottom = 100;
          };
        }
      ];

      appearance = {
        prefer_no_csd = true;
        border_width = 2;
        outer_border_width = 10;
        corner_radius = 16;
        drag_opacity = 0.75;
        opaque_fullscreen = true;

        blur = {
          enabled = true;
          optimized = true;
          passes = 4;
          noise = 0.03;
          saturation = 1.0;
        };
      };

      # INPUT
      input = {
        keyboard = {
          layout = "us,es";
          options = "grp:win_space_toggle";
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
        # "Mod+Space" = "keyboard-layout-next";

        # Applications and session
        "Mod+Return" = { action = "spawn:kitty"; repeat = false; };
        "Mod+Q" = { action = "window-close"; repeat = false; };
        "Mod+Escape" = "session-quit";

        # Layouts: dwindle
        "Mod+U" = "workspace-next";
        "Mod+I" = "workspace-previous";
        "Mod+WheelDown" = "workspace-next";
        "Mod+WheelUp" = "workspace-previous";
        "Mod+Alt+T" = "layout-toggle-split";

        # Layouts: scrolling
        "Mod+C" = "column-center";
        "Mod+Shift+WheelUp" = "window-focus-left";
        "Mod+Shift+WheelDown" = "window-focus-right";
        "Mod+R" = "window-cycle-primary-extent";
        "Mod+Shift+R" = "window-cycle-primary-extent-back";
        "Mod+M" = { action = "window-toggle-maximize"; repeat = false; };
        "Mod+W" = { action = "column-toggle-tabbed"; repeat = false; };

        # Layouts: floating
        "Mod+T" = { action = "window-toggle-floating"; repeat = false; };

        # General
        "Mod+Tab" = "workspace-focus-last";

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

        # Pinned window
        "Mod+P" = { action = "window-toggle-pinned"; repeat = false; };

        # Fullscreen
        "Mod+F" = { action = "window-toggle-maximize-to-edges"; repeat = false; };
        "Mod+Shift+F" = { action = "window-toggle-fullscreen"; repeat = false; };
        "Mod+O" = { action = "overview-toggle"; repeat = false; };

        # Workspaces
        "Mod+1" = "workspace-switch:1";
        "Mod+2" = "workspace-switch:2";
        "Mod+3" = "workspace-switch:3";
        "Mod+4" = "workspace-switch:4";
        "Mod+5" = "workspace-switch:5";
        "Mod+6" = "workspace-switch:6";
        "Mod+7" = "workspace-switch:7";
        "Mod+8" = "workspace-switch:8";
        "Mod+9" = "workspace-switch:9";
        "Mod+Shift+1" = "window-move-to-workspace:1";
        "Mod+Shift+2" = "window-move-to-workspace:2";
        "Mod+Shift+3" = "window-move-to-workspace:3";
        "Mod+Shift+4" = "window-move-to-workspace:4";
        "Mod+Shift+5" = "window-move-to-workspace:5";
        "Mod+Shift+6" = "window-move-to-workspace:6";
        "Mod+Shift+7" = "window-move-to-workspace:7";
        "Mod+Shift+8" = "window-move-to-workspace:8";
        "Mod+Shift+9" = "window-move-to-workspace:9";
      };

      # LAYOUT
      layout = {
        mode = "dwindle"; # "scrolling", "dwindle", "master" or "floating"
        extent_presets = [ 0.333 0.5 0.667 ];
        gap = 20;
        # client_maximize = "column";

        scrolling = {
          default_extent_fraction = 0.5;
          # center_on_overview_select = true;
        };
      };

      # HOT CORNERS
      hot_corners.top_left = {
        enabled = true;
        delay_ms = 100;
        action = "overview-open";
      };

      window_rule = [
        {
          blur = true;
        }
      ];
    };
  };
}
