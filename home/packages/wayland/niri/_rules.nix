{
  window-rule = [
    # Regla 1: Aplicaciones maximizadas al abrir
    {
      match = [
        { _props = { app-id = "zen"; }; }
        { _props = { app-id = "vesktop"; }; }
        { _props = { app-id = "spotify"; }; }
        { _props = { app-id = "firefox"; }; }
      ];
      open-maximized = true;
    }

    # Regla 2: Opacidad para Nautilus y G4Music
    {
      match._props = { app-id = "com.github.neithern.g4music|org.gnome.Nautilus"; };
      opacity = 1.0;
    }

    # Regla 3: Diálogos de archivo flotantes en Nautilus
    {
      match._props = {
        app-id = "org.gnome.Nautilus";
        title = ".*(File|Save|Open|Upload).*";
      };
      open-floating = true;
      default-window-height.fixed = 800;
      default-column-width.fixed = 1200;
    }

    {
      geometry-corner-radius = 10;
      clip-to-geometry = true;
      tiled-state = true;
      draw-border-with-background = false;
      background-effect = {
        blur = true;
        xray = false;
      };
    }
  ];

  layer-rule = [
    {
      match._props = { namespace = "vicinae"; };
      background-effect = {
        xray = false;
      };
    }
  ];
}
