{ pkgs, config, ... }:
let
  # mactahoe-icon-theme = pkgs.stdenv.mkDerivation {
  #   pname = "mactahoe-icon-theme";
  #   version = "unstable-2026-08-05";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "vinceliuice";
  #     repo = "MacTahoe-icon-theme";
  #     rev = "main";
  #     hash = "sha256-Ho71thvHpgQICfC0c67ClKRONdDeNVfg0bGU6ZjM3S8=";
  #   };
  #   nativeBuildInputs = [ pkgs.gtk3 ];
  #   installPhase = ''
  #     runHook preInstall
  #     mkdir -p $out/share/icons
  #     patchShebangs install.sh
  #     ./install.sh -n MacTahoe -d $out/share/icons
  #     find $out/share/icons -xtype l -delete
  #     runHook postInstall
  #   '';
  # };
in
{
  home.packages = with pkgs; [
    bibata-cursors
    gsettings-desktop-schemas
    glib
    xdg-user-dirs
    adw-gtk3
    ffmpeg-headless
    ffmpegthumbnailer
    totem
    tumbler
    papirus-icon-theme
    # papirus-folders
  ];

  home.file = {
    "dev/.keep".text = "";
    "repos/.keep".text = "";
  };

  gtk = {
    enable = true;
    font = {
      name = "SF Pro Display";
      size = 12;
    };
    iconTheme = {
      name = "Papirus";
      # package = pkgs.whitesur-icon-theme;
    };
    gtk3.bookmarks = [
      "file://${config.home.homeDirectory}/Downloads"
      "file://${config.home.homeDirectory}/Documents"
      "file://${config.home.homeDirectory}/Pictures"
      "file://${config.home.homeDirectory}/Videos"
      "file://${config.home.homeDirectory}/Music"
      "file://${config.home.homeDirectory}/dev"
      "file://${config.home.homeDirectory}/repos"
    ];
  };
}
