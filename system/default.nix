{ inputs, pkgs, ... }: {

  imports = [
    (inputs.import-tree ./hardware)
  ];
}
