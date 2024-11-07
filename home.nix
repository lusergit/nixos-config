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
            ./homeManager/media.nix
            ./homeManager/fish.nix
            ./homeManager/mail.nix
          ];
          home.stateVersion = "24.05";
        };
    };
  };
}
