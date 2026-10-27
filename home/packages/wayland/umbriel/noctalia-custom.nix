{ ... }:

{
  # Se fusiona con programs.umbriel.settings de umbriel.nix
  programs.umbriel.settings = {
    general.autostart = [ "noctalia" ];

    keybinds = {
      "Mod+D" = "spawn:noctalia msg dock-toggle";
      "Mod+B" = "spawn:noctalia msg bar-toggle";
      "Mod+Shift+Q" = "spawn:noctalia msg panel-toggle session";
      "Mod+Shift+I" = "spawn:noctalia msg settings-toggle";
      "Mod+Shift+W" = "spawn:noctalia msg panel-toggle wallpaper";
      "Mod+Alt+L" = "spawn:noctalia msg session lock";
      "Ctrl+Shift+Escape" = "spawn:noctalia msg panel-open control-center system";

      # Launcher
      "Alt+Space" = "spawn:noctalia msg panel-toggle launcher";

      # Multimedia
      "F7" = { action = "spawn:noctalia msg media previous"; allow_when_locked = true; };
      "F8" = { action = "spawn:noctalia msg media toggle"; allow_when_locked = true; repeat = false; };
      "F9" = { action = "spawn:noctalia msg media next"; allow_when_locked = true; };

      # Volume
      "F10" = { action = "spawn:noctalia msg volume-mute"; allow_when_locked = true; repeat = false; };
      "F11" = { action = "spawn:noctalia msg volume-down"; allow_when_locked = true; };
      "F12" = { action = "spawn:noctalia msg volume-up"; allow_when_locked = true; };

      # Emojis
      "Mod+Period" = "spawn:noctalia msg panel-toggle launcher '/emo '";

      # Screenshots
      "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
      "Mod+Ctrl+S" = "spawn:noctalia msg annotate";
      "Mod+Alt+S" = "spawn:noctalia msg screenshot-fullscreen pick";
    };

    # Layers
    layer_rule = [
      {
        match.namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^\"]*)$";
        blur = true;
        blur_ignore_alpha = 0.5;
        blur_popups = true;
      }
      {
        match.namespace = "^noctalia-(notification|dock|panel|attached-panel|osd)$";
        blur_optimized = false;
      }
    ];

    # Rules
    window_rule = [
      {
        match.app_id = "^dev.noctalia.Noctalia$";
        default_floating = true;
        default_floating_size_px = { width = 1020; height = 900; };
      }
    ];
  };
}
