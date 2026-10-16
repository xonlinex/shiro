{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    sushi
    ffmpeg-headless
    ffmpegthumbnailer
  ];

  # D-Bus (sushi)
  xdg.dataFile."dbus-1/services/org.gnome.NautilusPreviewer.service".source =
    "${pkgs.sushi}/share/dbus-1/services/org.gnome.NautilusPreviewer.service";

  # Thumbnailer .mkv
  xdg.dataFile."thumbnailers/ffmpegthumbnailer-mkv.thumbnailer".text = ''
    [Thumbnailer Entry]
    TryExec=${pkgs.ffmpegthumbnailer}/bin/ffmpegthumbnailer
    Exec=${pkgs.ffmpegthumbnailer}/bin/ffmpegthumbnailer -i %i -o %o -s %s -f
    MimeType=video/x-matroska;video/matroska;video/x-matroska-3d;application/x-matroska;
  '';
}
