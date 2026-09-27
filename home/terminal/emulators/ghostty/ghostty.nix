{ pkgs, ... }:

{
  # Enlaza los temas locales a ~/.config/ghostty/themes
  xdg.configFile."ghostty/themes".source = ./themes;

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      font-family = "ZedMono Nerd Font";
      # font-style = "Medium";
      # adjust-cell-height = "20%";
      font-size = "17";

      # Window
      window-padding-x = "25";
      window-padding-y = "25";
      background-opacity = "1.0";

      # UI
      # theme = "dark:Kanso Zen,light:Kanso Pearl";
      # theme = "dark:Kanagawa Dragon,light:Kanagawa Lotus";
      # theme = "dark:Catppuccin Mocha,light:Catppuccin Latte";
      # theme = "dark:tokyonight-night, light:TokyoNight Day";
      # theme = "dark:Gruvbox Dark, light:Gruvbox Light";
      # theme = "dark:Rose Pine,light:Rose Pine Dawn";
      # theme = "Jellybeans";
      # theme = "sora";
      # theme = "luna";
      theme = "cendre-medium";
      window-theme = "system";
      window-decoration = "false";
      scrollbar = "system";
      scrollback-limit = "10000";
      confirm-close-surface = "false";

      # Notifications
      desktop-notifications = "true";
      notify-on-command-finish = "unfocused";
      notify-on-command-finish-action = "bell,notify";
      notify-on-command-finish-after = "30s";

      # Cursor
      cursor-style = "bar";
      cursor-style-blink = "true";

      # Shaders
      custom-shader = "${./shaders/cursor_warp.glsl}";

      # resize-overlay = "never";
      # bell-features = "audio";
      # window-inherit-working-directory = "true";
      # gtk-single-instance = "true";
      # quit-after-last-window-closed = "false";
      # adjust-cursor-height = "40%";
      # adjust-cursor-thickness = "100%";
      # adjust-box-thickness = "100%";
      # adjust-underline-thickness = "100%";
      # adjust-underline-position = "110%";
    };
  };
}
