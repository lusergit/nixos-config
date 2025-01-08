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
            ./home-manager/development.nix
            ./home-manager/emacs.nix
            ./home-manager/fish.nix
            ./home-manager/mail.nix
            ./home-manager/media.nix
            ./home-manager/window-manager.nix
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
