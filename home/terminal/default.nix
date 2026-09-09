{
  pkgs,
  config,
  inputs,
  ...
}: {

  home.packages = with pkgs; [
    tree-sitter
    curl
    wget
    less
    ripgrep
    fd
    gcc
    duff
    imagemagick
    openssh
    unzip
    duf
  ];

  imports = [
    (inputs.import-tree ./emulators)
    (inputs.import-tree ./shell)
    (inputs.import-tree ./software)
  ];
  # environment.sessionVariables = {
  #   LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
  #   LESKEY = "${config.xdg.configHome}/less/lesskey";
  #   XAUTHORITY = "${config.xdg.runtimeDir}/Xauthority";
  #
  #   EDITOR = "hx";
  #   DIRENV_LOG_FORMAT = "";
  #
  #   # auto-run programs using nix-index-database
  #   NIX_AUTO_RUN = "1";
  # };
}
