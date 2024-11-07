{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    homeManager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "homeManager";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      homeManager,
      nix-index-database,
      plasma-manager,
    }:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      nixosConfigurations.lHost = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          homeManager.nixosModules.home-manager
          {
            homeManager.useGlobalPkgs = true;
            homeManager.useUserPackages = true;
            homeManager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
            homeManager.users.luser = import ./home.nix;
          }
          nix-index-database.nixosModules.nix-index
        ];
      };
    };
}
