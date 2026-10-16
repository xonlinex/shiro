{ pkgs, ... }:
{
  programs.vicinae = {
    enable = true;

    settings = {
      close_on_focus_loss = true;
      pop_to_root_on_close = true;
      keybinding = "emacs";

      keybinds = {
        "open-search-filter" = "control+F";
      };

      tray = {
        enabled = false;
      };

      theme = {
        dark = {
          name = "noctalia";
          icon_theme = "auto";
        };
        light = {
          name = "noctalia";
          icon_theme = "auto";
        };
      };

      font = {
        normal = {
          family = "SF Pro Display";
          size = 11;
        };
      };

      launcher_window = {
        rounding = 16;
        opacity = 0.7;

        client_side_decorations = {
          enabled = true;
          border_width = 1;
        };
      };
    };
  };
}
