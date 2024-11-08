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

  # boot config
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      systemd.enable = true;
      services.lvm.enable = true;
    };

    plymouth = {
      enable = true;
      theme = "connect";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override { selected_themes = [ "connect" ]; })
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;
  };

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
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
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
        "libvirtd"
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

  virtualisation = {
    containers.enable = true;
    docker.enable = true;

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    docker-compose
    guix
    kdePackages.sddm-kcm
  ];

  programs = {
    fish.enable = true;
    git.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "widget.use-xdg-desktop-portal.mime-handler" = 1;
      };
    };
    virt-manager.enable = true;
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
