{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    sushi
    ffmpeg-headless
    ffmpegthumbnailer
  ];

  # Nautilus pide la vista previa por D-Bus; esto hace que el bus encuentre a Sushi
  xdg.dataFile."dbus-1/services/org.gnome.NautilusPreviewer.service".source =
    "${pkgs.sushi}/share/dbus-1/services/org.gnome.NautilusPreviewer.service";
}
