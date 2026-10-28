{
  pkgs,
  config,
  ...
}:
{
  home.file.".config/noctalia/save-wallpaper-mode.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      NOCTALIA_CONFIG="$HOME/.config/noctalia/"

      CURRENT_MODE=$(noctalia msg theme-mode-get 2>/dev/null)

      if [ "$CURRENT_MODE" = "light" ]; then
        echo "$(noctalia msg wallpaper-get)" > "$NOCTALIA_CONFIG/light-wallpaper"
      else
        echo "$(noctalia msg wallpaper-get)" > "$NOCTALIA_CONFIG/dark-wallpaper"
      fi
    '';
  };
}
