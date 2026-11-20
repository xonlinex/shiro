{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # apps
    nautilus
    loupe
    papers
    qbittorrent
    obs-studio
    decibels
    # kdePackages.qt6ct

    # utilities
    wl-clipboard
    wl-clip-persist
    cliphist
    libnotify
    # xwayland-satellite

    # Software for Programming
    dbeaver-bin
    postman
    hyprpicker
    slurp
    grim
    # nodejs
    # jdk21
    # maven
    # cargo
    #x11
    # languajes
    # jdk25
    # maven
  ];
}
