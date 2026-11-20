{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # apps
    loupe
    papers
    qbittorrent
    obs-studio
    decibels

    # utilities
    wl-clipboard
    wl-clip-persist
    cliphist
    libnotify

    # Software for Programming
    dbeaver-bin
    postman
  ];
}
