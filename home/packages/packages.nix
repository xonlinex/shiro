{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gapless
    wl-clipboard
    cliphist
    wl-clip-persist
    libnotify
    vesktop
    loupe
    nautilus
    papers
    # Software for Programming
    dbeaver-bin
    postman
    neovim
    fastfetch
    ghostty
    git
    nodejs
    openjdk21
    python3
    maven
    cargo
    #x11
    xwayland-satellite
  ];
}
