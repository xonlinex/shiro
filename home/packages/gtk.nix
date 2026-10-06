{ pkgs, config, ... }:
let
  mactahoe-icon-theme = pkgs.stdenv.mkDerivation {
    pname = "mactahoe-icon-theme";
    version = "unstable-2026-08-05";
    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "MacTahoe-icon-theme";
      rev = "839848b9a8a38a92a6936e30c4abe35cc6f2546d";
      hash = "sha256-NAahlBOYub0QlqkYStamoCbyWh+H5JG/iFm4Ws9EU3A=";
    };
    nativeBuildInputs = [ pkgs.gtk3 ];
    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/icons
      patchShebangs install.sh
      ./install.sh -n MacTahoe -d $out/share/icons
      find $out/share/icons -xtype l -delete
      runHook postInstall
    '';
  };
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
    unrar
    # papirus-icon-theme
    # papirus-folders
    # colloid-icons-orange
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
      name = "MacTahoe";
      package = mactahoe-icon-theme;
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
