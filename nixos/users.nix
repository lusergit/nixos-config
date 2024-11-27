{
  config,
  lib,
  pkgs,
  ...
}:

{
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
}
