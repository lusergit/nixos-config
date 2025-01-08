{
  config,
  pkgs,
  lib,
  user,
  ...
}:
let
  cfg = config.luserModules.virtualization;
  inherit (lib) mkEnableOption mkIf;
in
{

  options.luserModules.virtualization = {
    enable = mkEnableOption "Virtualization";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.virt-manager ];
    services.udev.packages = [ pkgs.qmk-udev-rules ];

    virtualisation = {
      containers.enable = true;
      docker = {
        enable = true;
        enableOnBoot = false;
      };

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

    users.users.${user}.extraGroups = [ "libvirtd" ];
  };
}
