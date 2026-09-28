{ pkgs, ... }:

let
  apple-fonts = pkgs.callPackage ./Apple-Fonts/_default.nix { };
in
{
  home.packages = with pkgs; [
    google-fonts
    inter
    apple-fonts

    # nerdfonts
    nerd-fonts.symbols-only
    nerd-fonts.zed-mono
    nerd-fonts.victor-mono

    # normal fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts.fontconfig.enable = true;
}
