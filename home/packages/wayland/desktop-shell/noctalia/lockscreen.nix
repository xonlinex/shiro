{ vars, ... }:

{
  programs.noctalia = {
    enable = true;

    settings = {
      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        pre_action_fade_seconds = 0;

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600.0;
          };
          screen-off = {
            # action = "screen_off";
            enabled = false;
            # timeout = 660.0;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900.0;
          };
        };
      };

      lockscreen = {
        transition = [ "melt" ];
      };

      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@${vars.monitor}"
          "lockscreen-widget-0000000000000008"
          "lockscreen-widget-000000000000000b"
          "lockscreen-widget-000000000000000a"
          "lockscreen-widget-000000000000000c"
        ];

        widget = {
          "lockscreen-login-box@${vars.monitor}" = {
            box_height = 70.0;
            box_width = 330.0;
            cx = 1280.0;
            cy = 1260.0;
            output = vars.monitor;
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "login_box";
            settings = {
              background_color = "surface";
              background_opacity = vars.opacity;
              background_radius = vars.rounding;
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
            output = vars.monitor;
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "clock";
            settings = {
              background_color = "surface";
              background_opacity = vars.opacity;
              background_padding = 20;
              background_radius = vars.rounding;
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
            output = vars.monitor;
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "sticker";
            settings = {
              background_opacity = 0.0;
              image_path = vars.pfp;
            };
          };

          lockscreen-widget-000000000000000b = {
            box_height = 576.0;
            box_width = 608.0;
            cx = 1280.0;
            cy = 600.0;
            output = vars.monitor;
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "fancy_audio_visualizer";
            settings = {
              background = false;
              inner_diameter = 0.7;
              rotation_speed = 0.5;
              secondary_color = "primary";
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
            output = vars.monitor;
            # placement_height = 1440.0;
            # placement_width = 2560.0;
            type = "label";
            settings = {
              background_color = "surface";
              background_opacity = 0.7;
              background_padding = 10;
              background_radius = vars.rounding;
              color = "on_surface";
              shadow = vars.shadow-status;
              title = vars.username;
            };
          };
        };
      };
    };
  };
}
