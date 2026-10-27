{ pkgs, ... }:

{
  programs.opencode = {
    enable = true;

    cli = {
      theme = "system";
    };
  };
}
