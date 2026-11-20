{ config, ... }:

{
  _module.args.vars = {

    username = config.home.username;
    home-path = config.home.homeDirectory;
    profile-directory = config.home.profileDirectory;
    config-path = config.xdg.configHome;
    rounding = 10;
    opacity = 0.9;
    capsule-opacity = 0.1;
    shadow-status = false;

    # Fonts
    desktop-font = "Major Mono Display";

    # Umbriel outputs
    monitor = "HDMI-A-2";

    # Path image profile
    pfp = "${config.home.homeDirectory}/Pictures/furina-rounded.png";
  };
}
