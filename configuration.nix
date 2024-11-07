{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./nixos/nix.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = "lHost";

  # fonts
  fonts.packages = with pkgs; [ cascadia-code ];

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true;
  };

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    flatpak.enable = true;
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  security = {
    rtkit.enable = true;
    pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users = {

    defaultUserShell = pkgs.fish;
    groups = {
      luser = {
        gid = 1000;
      };
      tech = {
        gid = 1001;
      };
    };

    users.luser = {
      isNormalUser = true;
      group = "luser";
      extraGroups = [
        "wheel"
        "docker"
      ];
      uid = 1000;
      initialHashedPassword = "$y$j9T$7lDCCTadqFywZ1mwkx/sd1$MLsh98uFxqg7eqx.zAwm1/1oMH.reTc5u/B5FcUAY64";
    };

    users.tech = {
      isNormalUser = true;
      group = "tech";
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      uid = 1001;
    };
  };

  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation.docker.enable = true;
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by fault.
    wget
    mattermost-desktop
    spotify
    docker-compose
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.fish.enable = true;
  programs.git.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
      "widget.use-xdg-desktop-portal.mime-handler" = 1;
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
      };
    };
  };

  system.copySystemConfiguration = false;
  system.stateVersion = "24.05";

  nixpkgs.config = {
    allowUnfree = true;
  };

  hardware.enableAllFirmware = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      vulkan-validation-layers
      vulkan-extension-layer
      vaapiIntel
      intel-media-driver
      intel-compute-runtime
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
