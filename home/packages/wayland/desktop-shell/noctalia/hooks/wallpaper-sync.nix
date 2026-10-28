{
  pkgs,
  config,
  ...
}:
{
  home.file.".config/noctalia/wallpaper-sync.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      NOCTALIA_CONFIG="$HOME/.config/noctalia/"

      CURRENT_MODE=$(noctalia msg theme-mode-get 2>/dev/null)

      if [ "$CURRENT_MODE" = "light" ]; then
        WALLPAPER=$(cat "$NOCTALIA_CONFIG/light-wallpaper")
        noctalia msg wallpaper-set "$WALLPAPER"
      else
        WALLPAPER=$(cat "$NOCTALIA_CONFIG/dark-wallpaper")
        noctalia msg wallpaper-set "$WALLPAPER"
      fi
    '';
  };
}
