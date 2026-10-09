{ pkgs, ... }:

{
  programs.lazygit = {
    enable = true;

    settings = {
      gui = {
        nerdFontsVersion = "3";

        # ember theme
        theme = {
          activeBorderColor = [
            "#e08060"
            "bold"
          ];
          inactiveBorderColor = [
            "#73665b"
          ];
          searchingActiveBorderColor = [
            "#c8b468"
            "bold"
          ];
          optionsTextColor = [
            "#7890a0"
          ];
          selectedLineBgColor = [
            "#3e3c38"
          ];
          cherryPickedCommitFgColor = [
            "#171311"
          ];
          cherryPickedCommitBgColor = [
            "#b07878"
          ];
          markedBaseCommitFgColor = [
            "#171311"
          ];
          markedBaseCommitBgColor = [
            "#c8b468"
          ];
          unstagedChangesColor = [
            "#e08060"
          ];
          defaultFgColor = [
            "#d8d0c0"
          ];
        };
      };
    };
  };
}
