{
  pkgs,
  inputs,
  ...
}:
{

  home.packages = with pkgs; [
    tree-sitter
    curl
    wget
    ripgrep
    fd
    gcc
    duff
    imagemagick
    unzip
    duf
    sesh
    git
    jq
  ];

  imports = [
    (inputs.import-tree ./emulators)
    (inputs.import-tree ./shell)
    (inputs.import-tree ./software)
  ];
}
