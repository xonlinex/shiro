{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.qylock.nixosModules.default
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # SDDM theme
  programs.qylock = {
    enable = true;
    theme = "dog-samurai";
  };
}
