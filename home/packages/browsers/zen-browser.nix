{ pkgs, inputs, config, ... }:


let
  username = "${config.home.username}";
in
{
  imports = [
    inputs.zen-browser.homeModules.default
  ];

  programs.zen-browser = {
    enable = true;

    profiles.${username} = {
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

        # Hardware video acceleration
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.enabled" = true;
        "widget.use-aspect-ratio" = true;
      };
    };
  };

  home.file.".config/zen/${username}/chrome/userChrome.css".text = ''
    @import "${config.home.homeDirectory}/.cache/noctalia/zen-browser/zen-userChrome.css";
  '';

  home.file.".config/zen/${username}/chrome/userContent.css".text = ''
    @import "${config.home.homeDirectory}/.cache/noctalia/zen-browser/zen-userContent.css";
  '';
}
