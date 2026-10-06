{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./displaymanager.nix
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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

  # Habilitar gestión de ratón y touchpad
  # services.libinput.enable = true;

  # WARNING: verify user
  users.users.xonlinex = {
    isNormalUser = true;
    description = "xOnlinEx";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    shell = pkgs.fish;
  };

  # Enable flakes and the new nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brightnessctl
    ffmpegthumbnailer
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];

  # environment.variables = {
  #   EDITOR = "nvim";
  #   VISUAL = "nvim";
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # programs.niri.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.fish.enable = true;
  programs.dconf.enable = true;

  virtualisation.docker.enable = true;
  # programs.hyprland.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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

  # services.xserver.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
