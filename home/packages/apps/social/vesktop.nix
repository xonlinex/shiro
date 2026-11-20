{ pkgs, ... }:
{
  programs.vesktop = {
    enable = true;

    settings = {
      discordBranch = "stable";
      minimizeToTray = true;
      arRPC = true;
      customTitleBar = false;
    };

    vencord = {
      settings = {
        enabledThemes = [ "noctalia.theme.css" ];
        useQuickCss = true;
      };

      # disable window controls
      extraQuickCss = ''
        body {
          --custom-window-controls: off !important;
        }
        [class*="winButtons_"],
        [class*="macButtons_"],
        [class*="windowControls_"] {
          display: none !important;
        }
      '';
    };
  };
}
