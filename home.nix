{ ... }:
{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.luser =
        { pkgs, ... }:
        {
          imports = [
            ./homeManager/development.nix
            ./homeManager/emacs.nix
            ./homeManager/fish.nix
            ./homeManager/mail.nix
            ./homeManager/media.nix
            ./homeManager/window-manager.nix
          ];

          home = {
            packages = with pkgs; [
              discord
              spotify
              telegram-desktop
              mattermost-desktop
              ispell
              aspell
            ];
            stateVersion = "24.11";
          };
        };
    };
  };
}
