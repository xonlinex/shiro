{
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    style=Fusion

    [Fonts]
    fixed="Monospace,11,-1,5,50,0,0,0,0,0"
    general="SF Pro Display,11,-1,5,50,0,0,0,0,0"
  '';
}
