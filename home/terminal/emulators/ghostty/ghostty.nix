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
      window-padding-x = "15";
      window-padding-y = "15";
      background-opacity = "0.85";

      # UI
      # theme = "dark:ember,light:ember-light";
      theme = "cendre";
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
