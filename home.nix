{ ... }:
{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.luser =
        { ... }:
        {
          imports = [
            ./homeManager/development.nix
            ./homeManager/emacs.nix
            ./homeManager/fish.nix
            ./homeManager/mail.nix
            ./homeManager/extras.nix
          ];
          home.stateVersion = "24.05";
        };
    };
  };
}
