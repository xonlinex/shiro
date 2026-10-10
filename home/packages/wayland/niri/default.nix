{ config, lib, pkgs, ... }:

let
  toKDL = import ./_to-KDL.nix { inherit lib pkgs; };
  monitors = import ./_monitors.nix;
  keybinds = import ./_binds.nix;
  inputs = import ./_input.nix;
  layout = import ./_layout.nix;
  animations = import ./_animations.nix;
  rules = import ./_rules.nix;
  autostart = import ./_autostart.nix;
  noctalia-settings = import ../desktop-shell/noctalia/_setttings-niri.nix;

  combineConfigs = lib.zipAttrsWith (name: values:
    if builtins.isList (builtins.head values)
    then lib.concatLists values
    else if builtins.isAttrs (builtins.head values)
    then combineConfigs values
    else lib.last values
  );

  myNiriConfig = combineConfigs [
    monitors
    keybinds
    inputs
    layout
    animations
    rules
    autostart
    noctalia-settings
  ];

  finalConfig = toKDL.generate "config.kdl" myNiriConfig;
in
{
  xdg.configFile."niri/config.kdl".text = builtins.readFile finalConfig;
}
