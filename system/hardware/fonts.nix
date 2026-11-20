{ pkgs, ... }:

let
  apple-fonts = pkgs.callPackage ../../pkgs/Apple-Fonts/_default.nix { };
in
{
  # lucidglyph
  environment.sessionVariables = {
    FREETYPE_PROPERTIES = "autofitter:no-stem-darkening=0 autofitter:darkening-parameters=500,400,1000,400,1500,300,2000,0 cff:no-stem-darkening=0 type1:no-stem-darkening=0 t1cid:no-stem-darkening=0";
  };

  fonts = {
    packages = with pkgs; [
      apple-fonts
      major-mono-display

      # nerdfonts
      nerd-fonts.symbols-only
      nerd-fonts.zed-mono

      # normal fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    enableDefaultPackages = false;

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = false;
        style = "slight";
      };
      subpixel = {
        rgba = "none"; # none, rgb (lucidglyph)
        lcdfilter = "default";
      };

      defaultFonts =
        let
          addAll = builtins.mapAttrs (_: v: [ "Symbols Nerd Font" ] ++ v ++ [ "Noto Color Emoji" ]);
        in
        addAll {
          serif = [ "New York Small" ];
          sansSerif = [ "SF Pro Display" ];
          monospace = [ "SF Mono" ];
          emoji = [ "Noto Color Emoji" ];
        };
    };

    fontDir = {
      enable = true;
      decompressFonts = true;
    };
  };
}
