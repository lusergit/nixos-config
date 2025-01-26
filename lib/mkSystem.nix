{
  nixpkgs,
  home-manager,
  nix-index-database,
  ...
}@flake-inputs:
system-name:
{
  system ? "x86_64-linux",
  user ? "luser",
  gpgKey ? "59AD88AE64BD1061",
  hostname ? "lHost",
  wan ? "${hostname}.local",
  overlays ? [ ],
  extraModules ? [ ],
  localModules ? [ ],
}:

let
  inherit (nixpkgs.lib) nixosSystem genAttrs;
in
nixosSystem rec {
  inherit system;

  modules = extraModules ++ [
    {
      config._module.args = {
        inherit user;
        currentSystemName = hostname;
        currentDomainName = wan;
        currentSystem = system;
        inputs = flake-inputs;
      };
    }

    {
      nixpkgs.overlays = overlays;
      networking = {
        hostName = hostname;
        networkmanager.enable = true;
      };
    }

    nix-index-database.nixosModules.nix-index


    ../nixos/base.nix
    ../hosts/${system-name}.nix

    {
      imports = [
        ../nixos/desktop-kde.nix
        ../nixos/desktop-gnome.nix
        ../nixos/virtualisation.nix
        ../nixos/work.nix

        ../overlays
      ];

      luserModules = genAttrs localModules (_: {
        enable = true;
      });
    }

    home-manager.nixosModules.home-manager

    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${user} = (
          { ... }:
          {
            imports = [
              ../home-manager
              nix-index-database.hmModules.nix-index
            ];
          }
        );
        extraSpecialArgs = {
          inherit user system gpgKey;
          inputs = flake-inputs;
        };
      };
    }
  ];
}
