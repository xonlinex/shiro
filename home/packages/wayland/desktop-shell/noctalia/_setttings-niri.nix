{
  include = {
    _args = [ "noctalia.kdl" ];
    _props = { optional = true; };
  };

  binds = {
    "Mod+D" = {
      _props = { hotkey-overlay-title = "Toggle dock"; };
      spawn-sh = "noctalia msg dock-toggle";
    };
    "Mod+B" = {
      _props = { hotkey-overlay-title = "Toggle bar"; };
      spawn-sh = "noctalia msg bar-toggle";
    };
    "Mod+Shift+Q" = {
      _props = { hotkey-overlay-title = "Powermenu"; };
      spawn-sh = "noctalia msg panel-toggle session";
    };
    "Mod+Shift+I" = {
      _props = { hotkey-overlay-title = "Settings"; };
      spawn-sh = "noctalia msg settings-toggle";
    };
    "Mod+Shift+W" = {
      _props = { hotkey-overlay-title = "Browser Wallpaper"; };
      spawn-sh = "noctalia msg panel-toggle wallpaper";
    };
    "Mod+Alt+L" = {
      _props = { hotkey-overlay-title = "Lock session"; };
      spawn-sh = "noctalia msg session lock";
    };
    "Ctrl+Shift+Escape" = {
      _props = { hotkey-overlay-title = "System Monitor"; };
      spawn-sh = "noctalia msg panel-open control-center system";
    };


    # Teclas multimedia y volumen
    "F12" = {
      _props = { allow-when-locked = true; };
      spawn-sh = "noctalia msg volume-up";
    };
    "F11" = {
      _props = { allow-when-locked = true; };
      spawn-sh = "noctalia msg volume-down";
    };
    "F10" = {
      _props = { allow-when-locked = true; };
      spawn-sh = "noctalia msg volume-mute";
    };
    "F9" = {
      _props = { allow-when-locked = true; };
      spawn-sh = "noctalia msg media next";
    };
    "F8" = {
      _props = { allow-when-locked = true; };
      spawn-sh = "noctalia msg media toggle";
    };
    "F7" = {
      _props = { allow-when-locked = true; };
      spawn-sh = "noctalia msg media previous";
    };
  };

  layer-rule = [
    {
      match._props = { namespace = "^noctalia-backdrop"; };
      place-within-backdrop = true;
    }
    {
      match._props = { namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$"; };
      background-effect = {
        xray = false;
      };
    }
  ];
}
