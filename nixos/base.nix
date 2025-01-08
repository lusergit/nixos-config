{ config, pkgs, user, ... }:

{
  system = {
    copySystemConfiguration = false;
    stateVersion = "24.11";

    activationScripts.update-diff = {
      supportsDryActivation = true;
      text =
        let
          nix = config.nix.package;
        in
        ''
          if [[ -e /run/current-system ]]; then
             echo "Packages updated:"
             ${nix}/bin/nix store diff-closures /run/current-system "$systemConfig"
          fi
        '';
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "Thu *-*-* 12:45";
      options = "--delete-older-than 14d";
    };

    optimise = {
      automatic = true;
      dates = [ "Thu *-*-* 12:45" ];
    };

    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "it_IT.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_TIME = "it_IT.UTF-8";
      LC_MONETARY = "it_IT.UTF-8";
      LC_PAPER = "it_IT.UTF-8";
      LC_TELEPHONE = "it_IT.UTF-8";
      LC_MEASUREMENT = "it_IT.UTF-8";
    };
  };

  time.timeZone = "Europe/Rome";

  fonts.packages = with pkgs; [ cascadia-code ];

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
    earlySetup = true;
  };

  environment = {
    systemPackages =
      with pkgs;
      [
        wget
        xq
        fd
        ripgrep
        eza
        bat
        docker-compose
        wl-clipboard
        geoclue2
      ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  users = {
    defaultUserShell = pkgs.fish;
    groups = {
      luser = {
        gid = 1000;
      };
    };

    users.${user} = {
      isNormalUser = true;
      group = "${user}";
      extraGroups = [
        "wheel"
        "docker"
        "libvirtd"
        "tss"
      ];
      uid = 1000;
      initialHashedPassword = "$y$j9T$7lDCCTadqFywZ1mwkx/sd1$MLsh98uFxqg7eqx.zAwm1/1oMH.reTc5u/B5FcUAY64";
    };
  };

  networking = {
    networkmanager.enable = true;
    hostName = "lHost";
  };

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "alt-intl,";
      xkb.options = "ctrl:nocaps";
    };

    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

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

    fwupd.enable = true;
  };

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
    steam.enable = true;

    nix-index.enable = true;
    command-not-found.enable = false;
  };

  security = {
    rtkit.enable = true;

    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
  };
}
