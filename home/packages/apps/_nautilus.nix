{ pkgs, inputs, ... }:

let
  myComputerPkg = inputs.nautilus-my-computer.packages.${pkgs.stdenv.hostPlatform.system}.default;

  # Entorno Python con las librerías gráficas requeridas por nautilus-my-computer
  nautilusPythonEnv = pkgs.python3.withPackages (
    ps: with ps; [
      pycairo
      pygobject3
    ]
  );

  nautilusWithExtensions = pkgs.symlinkJoin {
    name = "nautilus-with-extensions";
    paths = with pkgs; [
      nautilus
      nautilus-python
      myComputerPkg
    ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/nautilus \
        --set NAUTILUS_4_EXTENSION_DIR "$out/lib/nautilus/extensions-4" \
        --prefix PYTHONPATH : "${nautilusPythonEnv}/${pkgs.python3.sitePackages}" \
        --prefix XDG_DATA_DIRS : "${myComputerPkg}/share:${myComputerPkg}/share/gsettings-schemas/${myComputerPkg.name}"
    '';
  };
in
{
  home.packages = with pkgs; [
    (lib.hiPrio nautilusWithExtensions)
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
