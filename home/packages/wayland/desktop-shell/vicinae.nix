{ pkgs, ... }:
{
  programs.vicinae = {
    enable = true;

    settings = {
      close_on_focus_loss = true;
      pop_to_root_on_close = true;
      keybinding = "emacs";

      tray = {
        enabled = false;
      };

      theme = {
        dark = {
          name = "noctalia";
          icon_theme = "MacTahoe";
        };
        light = {
          name = "noctalia";
          icon_theme = "MacTahoe";
        };
      };
      font = {
        normal = {
          family = "SF Pro Dispaly";
          size = 10;
        };
      };

      launcher_window = {
        rounding = 16;
        opacity = 0.9;

        client_side_decorations = {
          enabled = true;
          border_width = 2;
        };
      };
    };
  };
}
