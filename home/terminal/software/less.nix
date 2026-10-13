{ pkgs, ... }: {
  home.sessionVariables = {
    LESS = "-R -I -X -F";
  };
}
