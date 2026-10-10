{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    bibata-cursors
    apple-cursor
    gsettings-desktop-schemas
    glib
    xdg-user-dirs
    # adw-gtk3
    ffmpeg-headless
    ffmpegthumbnailer
    unrar
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
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
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

  # Thumbnailer .mkv
  xdg.dataFile."thumbnailers/ffmpegthumbnailer-mkv.thumbnailer".text = ''
    [Thumbnailer Entry]
    TryExec=${pkgs.ffmpegthumbnailer}/bin/ffmpegthumbnailer
    Exec=${pkgs.ffmpegthumbnailer}/bin/ffmpegthumbnailer -i %i -o %o -s %s -f
    MimeType=video/x-matroska;video/matroska;video/x-matroska-3d;application/x-matroska;
  '';
}
