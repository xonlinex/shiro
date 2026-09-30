{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;

    bindings = {
      # MOUSE WHEEL CONTROLS
      "WHEEL_UP" = "seek 10";
      "WHEEL_DOWN" = "seek -10";
      "WHEEL_LEFT" = "seek -10";
      "WHEEL_RIGHT" = "seek 10";
      "Shift+WHEEL_UP" = "add volume 5";
      "Shift+WHEEL_DOWN" = "add volume -5";
    };
  };
}
