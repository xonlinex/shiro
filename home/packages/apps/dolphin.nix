{ pkgs, ... }:

{
  # 1. Instalar Dolphin y los generadores de miniaturas
  environment.systemPackages = with pkgs; [
    # Explorador de archivos
    kdePackages.dolphin
    kdePackages.dolphin-plugins

    # Motor de miniaturas para videos (FFmpeg)
    kdePackages.ffmpegthumbs

    # Miniaturas para imágenes, RAWs, PDFs y cómics
    kdePackages.kdegraphics-thumbnailers

    # Herramientas de soporte del sistema
    ffmpegthumbnailer
    shared-mime-info
  ];

  # 2. Servicios de soporte para montaje de discos, papelera y permisos
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  security.polkit.enable = true;

  # 3. Asegurar que las variables de entorno reconozcan los plugins Qt/KDE en GNOME/Wayland
  qt = {
    enable = true;
    platformTheme = "gnome"; # Adapta el tema visual si usas GNOME/GTK
    style = "adwaita-dark";
  };

  # 4. Forzar la integración de rutas de thumbnailers y mime types
  environment.pathsToLink = [
    "/share/thumbnailers"
    "/share/mime"
  ];

  # 5. Configuración por defecto de Dolphin (Previsualizaciones activas sin límite de tamaño)
  home-manager.users.xonlinex.xdg.configFile."dolphinrc".text = ''
    [PreviewSettings]
    # Habilitar plugins de vista previa (incluye ffmpegthumbs, imágenes y directorios)
    Plugins=ffmpegthumbs,directorythumbnail,imagethumbnail,jpegthumbnail,svgthumbnail,gsthumbnail

    # Límite de tamaño de archivo para miniaturas en bytes (0 = sin límite para que procese videos de 1.2GB+)
    MaximumSize=0
  '';
}
