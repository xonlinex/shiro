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
          capsule_opacity = 0.1;
          capsule_padding = 10.0;
          capsule_radius = 16;
          capsule_thickness = 0.8;
          thickness = 40;
          margin_edge = 0;
          margin_ends = 0;
          padding = 15;
          position = "top";
          radius = 16;
          shadow = false;
          widget_spacing = 5;

          start = [ "launcher" "workspaces" "active_window" ];
          center = [ "media" ];
          end = [
            "tray"
            "keyboard_layout"
            "privacy"
            "group:g1"
            "volume"
            "clock"
            "notifications"
            "control-center"
          ];

          capsule_group = [
            {
              id = "g1";
              enabled = true;
              fill = "primary";
              members = [ "cpu" "ram" "sysmon" ];
              opacity = 0.1;
              padding = 12.0;
              radius = 16.0;
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

      desktop_widgets = {
        enabled = false;
      };

      dock = {
        enabled = false;
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

      notification = {
        background_opacity = 0.85;
        max_visible = 3;
        offset_y = 20;
      };

      osd = {
        background_opacity = 0.85;
        offset_x = 0;
        offset_y = 20;
        position = "bottom_center";
      };

      shell = {
        app_icon_color = "secondary";
        avatar_path = "/home/xonlinex/Pictures/avatar.jpg";
        corner_radius_scale = 1.0;
        font_family = "Outfit";
        panel = {
          control_center_placement = "attached";
          control_center_position = "auto";
          open_near_click_control_center = true;
          shadow = true;
          transparency_mode = "glass";
          wallpaper_placement = "attached";
          wallpaper_position = "center";
        };
        screen_corners = {
          enabled = true;
          size = 32;
        };
        shadow = {
          direction = "center";
        };
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";
        templates = {
          builtin_ids = [ "gtk3" "gtk4" "niri" ];
          community_ids = [ "discord" "vicinae" "zen-browser" ];
        };
      };

      widget = {
        active_window = {
          display = "icon_and_text";
        };
        clock = {
          capsule = true;
          format = " {:%d %b, %H:%M}";
        };
        control-center = {
          capsule = true;
          capsule_padding = 2;
          # capsule_radius = 20;
          custom_image = "/home/xonlinex/Pictures/avatar-rounded.png";
          scale = 1.5;
        };
        cpu = {
          display = "text";
          stat = "cpu_usage";
          visualization = "none";
        };
        launcher = {
          capsule = true;
          capsule_padding = 5;
          custom_image = "/home/xonlinex/Pictures/nixos-cendre-50.png";
          scale = 1.25;
        };
        media = {
          hide_when_no_media = true;
          max_length = 300;
          title_scroll = "always";
        };
        privacy = {
          hide_inactive = true;
        };
        ram = {
          display = "text";
          visualization = "none";
        };
        sysmon = {
          show_value = true;
          stat = "disk_used";
          visualization = "none";
        };
        taskbar = {
          inactive_opacity = 0.7;
          only_active_workspace = true;
          show_active_indicator = false;
        };
        workspaces = {
          active_pill_size = 2.0;
          empty_color = "secondary";
          show_labels = true;
          style = "regular";
        };
      };
    };
  };
}
