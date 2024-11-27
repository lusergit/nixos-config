{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./nixos/boot.nix
    ./nixos/console.nix
    ./nixos/environment.nix
    ./nixos/fonts.nix
    ./nixos/hardware.nix
    ./nixos/i18n.nix
    ./nixos/networking.nix
    ./nixos/nix.nix
    ./nixos/programs.nix
    ./nixos/security.nix
    ./nixos/services.nix
    ./nixos/system.nix
    ./nixos/time.nix
    ./nixos/users.nix
    ./nixos/virtualisation.nix
  ];
}
