{ pkgs, inputs, config, ... }:
{
  programs.zen-browser = {
    enable = true;

    profiles.xonlinex = {
      id = 0;
      isDefault = true;

      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        bitwarden
        surfingkeys
        darkreader
      ];

      # mods = [
      #   "c6813222-6571-4ba6-8faf-58f3343324f6"
      # ];

      settings = {
        "intl.accept_languages" = "en-US,en,es-ES,es";
        "zen.view.experimental-no-window-controls" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "zen.widget.linux.transparency" = false;
        "signon.rememberSignons" = false;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
      };
    };
  };

  home.file.".config/zen/xonlinex/chrome/userChrome.css".text = ''
    @import "${config.home.homeDirectory}/.cache/noctalia/zen-browser/zen-userChrome.css";
  '';

  home.file.".config/zen/xonlinex/chrome/userContent.css".text = ''
    @import "${config.home.homeDirectory}/.cache/noctalia/zen-browser/zen-userContent.css";
  '';
}
