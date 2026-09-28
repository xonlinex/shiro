{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # apps
    gapless
    nautilus
    loupe
    papers
    qbittorrent

    # utilities
    wl-clipboard
    wl-clip-persist
    cliphist
    libnotify
    xwayland-satellite

    # Software for Programming
    dbeaver-bin
    postman
    neovim
    # nodejs
    # openjdk21
    # python3
    # maven
    # cargo
    #x11
  ];
}
