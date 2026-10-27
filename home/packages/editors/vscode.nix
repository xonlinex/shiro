{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscjava.vscode-java-pack
        bbenoist.nix
      #   mkhl.direnv
      #   esbenp.prettier-vscode
      ];

      userSettings = {
        "editor.fontSize" = 17;
        "editor.fontFamily" = "Maple Mono NF";
        "editor.formatOnSave" = true;
        # "nix.enableLanguageServer" = true;
        # "nix.serverPath" = "nil";
      };
    };
  };
}
