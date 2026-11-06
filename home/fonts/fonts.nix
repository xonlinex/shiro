{ pkgs, ... }:

let
  apple-fonts = pkgs.callPackage ./Apple-Fonts/_default.nix { };
in
{
  home.packages = with pkgs; [
    apple-fonts
    # orbitron
    # rajdhani
    # audiowide
    # syne
    major-mono-display

    # nerdfonts
    nerd-fonts.symbols-only
    nerd-fonts.zed-mono
    nerd-fonts.victor-mono
    maple-mono.NF

    # normal fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts.fontconfig.enable = true;
}
