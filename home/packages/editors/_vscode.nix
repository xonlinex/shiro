{ pkgs, inputs, ... }:

let
  marketplace = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace;
in
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions =
        (with pkgs.vscode-extensions; [
          bbenoist.nix                          # Lsp nix
          ms-azuretools.vscode-docker           # Docker
          pkief.material-icon-theme             # Icon theme
          redhat.java                           # Lsp java
          redhat.vscode-xml                     # Lsp xml
          vscjava.vscode-gradle                 # Gradle
          vscjava.vscode-java-debug             # Debugger
          vscjava.vscode-java-dependency        # Project Manager
          vscjava.vscode-java-test              # Test Runner
          vscjava.vscode-maven                  # Maven
          vscjava.vscode-spring-initializr      # Spring initializr
          vscodevim.vim                         # Vim mode
        ])
        ++ (with marketplace; [
          vmware.vscode-spring-boot             # Lsp for application.{properties,yml} spring-boot
          vscjava.vscode-lombok                 # Lombok
          vscjava.vscode-spring-boot-dashboard  # Spring-boot dashboard
        ]);

      userSettings = {
        "editor.fontSize" = 17;
        "editor.fontFamily" = "Maple Mono NF";
        "editor.formatOnSave" = true;
        "editor.cursorSurroundingLines" = 8;
        "terminal.integrated.fontFamily" = "Maple Mono NF";
        "terminal.integrated.fontSize" = 17;
        "workbench.iconTheme" = "material-icon-theme";
        "editor.cursorBlinking" = "solid";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorStyle" = "line";
        "editor.fontLigatures" = true;
        "editor.lineNumbers" = "relative";
        "editor.minimap.enabled" = false;
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.scrollbar.verticalScrollbarSize" = 0;
        "editor.smoothScrolling" = true;
        "workbench.editor.showTabs" = "single";
        "vim.handleKeys" = {
          "<C-j>" = false;
          "<C-p>" = false;
          "<C-k>" = false;
          "<C-b>" = false;
        };
        "vim.useSystemClipboard" = true;
        # "nix.enableLanguageServer" = true;
        # "nix.serverPath" = "nil";
      };
    };
  };
}
