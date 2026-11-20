{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./displaymanager.nix
    inputs.umbriel.nixosModules.default
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 10;

      systemd-boot = {
        enable = true;
        configurationLimit = 50;
      };
    };
  };

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Timezone.
  time.timeZone = "America/La_Paz";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # usb
  services.gvfs.enable = true;

  # WARNING: verify user
  users.users.xonlinex = {
    isNormalUser = true;
    description = "xOnlinEx";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
  };

  # Enable flakes and the new nix command
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    # This adds cache servers so that Devenv can download everything precompiled and instantly.
    substituters = [ "https://devenv.cachix.org" ];
    trusted-public-keys = [ "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=" ];
  };

  programs.umbriel.enable = true;
  programs.fish.enable = true;
  programs.dconf.enable = true;

  virtualisation.docker.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.power-profiles-daemon.enable = true;
  system.stateVersion = "26.05";
}
