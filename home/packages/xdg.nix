{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];

    config.common = {
      default = [
        "umbriel"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = [ "luciole" ];
    };
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Browser (Zen Browser)
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "application/x-extension-htm" = [ "zen-beta.desktop" ];
      "application/x-extension-html" = [ "zen-beta.desktop" ];
      "application/x-extension-shtml" = [ "zen-beta.desktop" ];
      "application/xhtml+xml" = [ "zen-beta.desktop" ];
      "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
      "application/x-extension-xht" = [ "zen-beta.desktop" ];

      # Discord / Vesktop
      "x-scheme-handler/discord" = [ "vesktop.desktop" ];

      # Video Multiplayer (MPV)
      "video/mp4" = [ "mpv.desktop" ];
      "video/mkv" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];
      "video/avi" = [ "mpv.desktop" ];
      "video/x-msvideo" = [ "mpv.desktop" ];
      "video/quicktime" = [ "mpv.desktop" ];
      "video/mpeg" = [ "mpv.desktop" ];
      "video/ogg" = [ "mpv.desktop" ];
      "video/3gpp" = [ "mpv.desktop" ];
      "video/x-flv" = [ "mpv.desktop" ];

      # Documents (Evince)
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "application/postscript" = [ "org.gnome.Evince.desktop" ];
      "application/x-cbz" = [ "org.gnome.Evince.desktop" ]; # Cómics / Manga
      "application/x-cbr" = [ "org.gnome.Evince.desktop" ];
      "image/vnd.djvu" = [ "org.gnome.Evince.desktop" ];

      # Images (Loupe)
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/webp" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];
      "image/heic" = [ "org.gnome.Loupe.desktop" ];
      "image/avif" = [ "org.gnome.Loupe.desktop" ];
      "image/bmp" = [ "org.gnome.Loupe.desktop" ];
    };
  };
}
