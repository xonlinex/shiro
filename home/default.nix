{ inputs, pkgs, username, ... }: {
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.11";

  imports = [
    (inputs.import-tree ./packages)
    (inputs.import-tree ./fonts)
    ./terminal
    ./editors/editorconfig.nix
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";

    # DISPLAY = ":1";
    # _JAVA_AWT_WM_NONREPARENTING = "1";
    # XDG_CURRENT_DESKTOP = "niri";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
