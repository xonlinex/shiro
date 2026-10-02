{ inputs, config, ... }:

let
  monitor = "HDMI-A-2";
  username = "${config.home.username}";
  pfp = "${config.home.homeDirectory}/Pictures/avatar-rounded.png";
  rounding = 20;
  general-opacity = 1.0;
  capsule_opacity = 0.1;
  dock-opacity = 0.8;
  osd-opacity = 0.8;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      audio = {
        enable_sounds = true;
      };

      backdrop = {
        enabled = true;
      };

      bar = {
        order = [ "default" ];

        default = {
          font_family = "SF Pro Display";
          font_weight = 400;
          background_opacity = general-opacity;
          capsule = true;
          capsule_fill = "primary";
          capsule_opacity = capsule_opacity;
          capsule_padding = 10.0;
          capsule_radius = rounding;
          capsule_thickness = 0.7;
          thickness = 50;
          margin_edge = 0;
          margin_ends = 0;
          padding = 10;
          position = "top";
          radius = rounding;
          shadow = true;
          widget_spacing = 5;
          start = [ "launcher" "workspaces" "taskbar" "active_window" ];
          center = [ "clock" ];
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
              members = [ "cpu" "ram" "sysmon" ];
              opacity = capsule_opacity;
              padding = 12.0;
              radius = rounding;
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
        background_opacity = dock-opacity;
        cross_axis_padding = 10;
        icon_size = 40;
        inactive_opacity = 1.0;
        inactive_scale = 1.0;
        item_spacing = 5;
        launcher_position = "end";
        margin_edge = 10;
        edge_margin = 5;
        show_dots = true;
        radius = rounding;
        pinned = [
          "zen-beta"
          "org.gnome.Nautilus"
          "com.github.neithern.g4music"
          "sonora"
          "mpv"
          "org.gnome.Totem"
          "org.gnome.Papers"
          "org.gnome.Loupe"
          "com.mitchellh.ghostty"
          "postman"
          "dbeaver"
          "vesktop"
          "org.qbittorrent.qBittorrent"
        ];
      };

      hooks = {
        colors_changed = "~/.config/noctalia/toggle-theme.sh";
      };

      location = {
        auto_locate = true;
      };

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@${monitor}"
          "lockscreen-widget-0000000000000008"
          "lockscreen-widget-000000000000000b"
          "lockscreen-widget-000000000000000a"
          "lockscreen-widget-000000000000000c"
        ];

        widget = {
          "lockscreen-login-box@${monitor}" = {
            box_height = 70.0;
            box_width = 330.0;
            cx = 1280.0;
            cy = 1260.0;
            output = "${monitor}";
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "login_box";
            settings = {
              background_color = "surface";
              background_opacity = osd-opacity;
              background_radius = rounding;
              center_password_text = true;
              input_radius = 10.0;
              layout = "regular";
            };
          };

          lockscreen-widget-0000000000000008 = {
            box_height = 100.0;
            box_width = 200.0;
            cx = 2440.0;
            cy = 70.0;
            output = "${monitor}";
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "clock";
            settings = {
              background_color = "surface";
              background_opacity = osd-opacity;
              background_padding = 20;
              background_radius = rounding;
              # clock_style = "digital";
              color = "on_surface";
              format = "{:%I:%M %p}";
            };
          };

          lockscreen-widget-000000000000000a = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 1280.0;
            cy = 600.0;
            output = "${monitor}";
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "sticker";
            settings = {
              background_opacity = 0.0;
              image_path = pfp;
            };
          };

          lockscreen-widget-000000000000000b = {
            box_height = 576.0;
            box_width = 608.0;
            cx = 1280.0;
            cy = 600.0;
            output = "${monitor}";
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "fancy_audio_visualizer";
            settings = {
              background = false;
              inner_diameter = 0.7;
              rotation_speed = 0.5;
              secondary_color = "secondary";
              sensitivity = 0.5;
              visualization_mode = "wave";
              wave_thickness = 0.3;
            };
          };

          lockscreen-widget-000000000000000c = {
            box_height = 40.0;
            box_width = 120.0;
            cx = 1280.0;
            cy = 750.0;
            output = "${monitor}";
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "label";
            settings = {
              background_color = "primary";
              background_opacity = 0.2;
              background_padding = 10;
              background_radius = rounding;
              shadow = false;
              title = username;
            };
          };
        };
      };

      nightlight = {
        enabled = true;
      };

      notification = {
        background_opacity = osd-opacity;
        max_visible = 3;
        offset_y = 20;
      };

      osd = {
        background_opacity = osd-opacity;
        offset_x = 0;
        offset_y = 20;
        position = "bottom_center";
      };

      shell = {
        app_icon_color = "secondary";
        avatar_path = pfp;
        corner_radius_scale = 1.0;
        font_family = "SF Pro Display";
        panel = {
          control_center_placement = "attached";
          control_center_position = "auto";
          open_near_click_control_center = true;
          shadow = true;
          launcher_position = "top_left";
          transparency_mode = "glass";
          wallpaper_placement = "attached";
        };
        screen_corners = {
          enabled = true;
          size = rounding * 2;
        };
        shadow = {
          direction = "center";
        };
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content";
        templates = {
          builtin_ids = [ "gtk3" "gtk4" "niri" ];
          community_ids = [ "discord" "vicinae" "zen-browser" "sonora"];
        };
      };

      wallpaper = {
        transition = [ "disc" "honeycomb" "stripes" ];
        transition_on_startup = true;
      };

      widget = {
        active_window = {
          display = "text_only";
          max_length = 300;
        };
        clock = {
          capsule = true;
          format = "{:%I:%M %p} │ {:%a, %d %b}";
        };
        control-center = {
          capsule = true;
          capsule_padding = 4;
          # capsule_fill = "primary";
          # capsule_radius = 20;
          custom_image = pfp;
          scale = 1.5;
        };
        cpu = {
          display = "text";
          stat = "cpu_usage";
          visualization = "none";
        };
        launcher = {
          capsule = true;
          # capsule_padding = 7;
          capsule_radius = rounding;
          scale = 1.0;
          color = "primary";
          glyph = "flare-filled";
        };
        media = {
          hide_when_no_media = true;
          max_length = 300;
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
          visualization = "none";
        };
        sysmon = {
          show_value = true;
          stat = "disk_used";
          visualization = "none";
        };
        taskbar = {
          inactive_opacity = 0.5;
          only_active_workspace = true;
          show_active_indicator = false;
        };
        workspaces = {
          active_pill_size = 2.5;
          capsule = true;
          capsule_padding = 10;
          empty_color = "secondary";
          pill_scale = 0.6;
          show_labels = false;
          style = "regular";
        };
      };
    };
  };
}
