{ config, pkgs, ... }:

{
  home.packages = [ pkgs.devenv ];

  # home.sessionVariables.DEVENV_TUI = "false";

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;

    config.global = {
      hide_env_diff = true;
    };
  };

  xdg.configFile."devenv/config.yaml".text = ''
    version: 1
    tui:
      statusline:
          enabled: false
    '';

  programs.fish.interactiveShellInit = ''
    devenv hook fish | source
    '';
}
