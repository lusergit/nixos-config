{
  description = "lHosts + devenv";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
  };
  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      makeSystem = import ./lib/mkSystem.nix inputs;
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations = {
        lHostWork = makeSystem "lHostWork" {
          localModules = [
            "desktop-gnome"
            "virtualization"
            "work"
          ];
        };

        lHost = makeSystem "lHost" {
          localModules = [
            "desktop-gnome"
            "virtualization"
            "work"
          ];
        };
      };
      devShells.x86_64-linux.default =
        let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
        pkgs.mkShell {
          packages = [
            pkgs.nixd
          ];
        };
    };
}
