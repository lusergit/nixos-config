{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs = {
    nix-index.enable = true;
    command-not-found.enable = false;
  };

  system.activationScripts.update-diff = {
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
}
