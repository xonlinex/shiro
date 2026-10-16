{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    bibata-cursors
    apple-cursor
    gsettings-desktop-schemas
    glib
    xdg-user-dirs
    adw-gtk3
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

}
