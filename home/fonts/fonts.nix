{ pkgs, ... }:

{
  # 1. Paquetes de fuentes para tu usuario
  home.packages = with pkgs; [
    google-fonts
    # nerdfonts
    nerd-fonts.zed-mono
    nerd-fonts.victor-mono

    # normal fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  fonts.fontconfig.enable = true;
}
