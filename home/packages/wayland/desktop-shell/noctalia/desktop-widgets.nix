{ vars, ... }:

{
  programs.noctalia.settings.desktop_widgets = {
    enabled = false;
    schema_version = 2;
    widget_order = [
      "desktop-widget-0000000000000001"
      "desktop-widget-0000000000000002"
      "desktop-widget-0000000000000003"
    ];

    widget = {
      "desktop-widget-0000000000000001" = {
        box_height = 120.0;
        box_width = 600.0;
        cx = 1280.0;
        cy = 300.0;
        output = vars.monitor;
        placement_height = 1440.0;
        placement_width = 2560.0;
        type = "clock";

        settings = {
          background = false;
          color = "primary";
          font_family = vars.desktop-font;
          format = "{:%A}";
          shadow = true;
        };
      };

      "desktop-widget-0000000000000002" = {
        box_height = 70.0;
        box_width = 200.0;
        cx = 1280.0;
        cy = 380.0;
        output = vars.monitor;
        placement_height = 1440.0;
        placement_width = 2560.0;
        type = "clock";

        settings = {
          background = false;
          color = "primary";
          font_family = vars.desktop-font;
          format = "{:%d %b %Y}";
          shadow = true;
        };
      };

      "desktop-widget-0000000000000003" = {
        box_height = 70.0;
        box_width = 200.0;
        cx = 1280.0;
        cy = 220.0;
        output = vars.monitor;
        placement_height = 1440.0;
        placement_width = 2560.0;

        settings = {
          background = false;
          color = "primary";
          font_family = vars.desktop-font;
          format = "-{:%H:%M}-";
          shadow = true;
        };
      };
    };
  };
}
