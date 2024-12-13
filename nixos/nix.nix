{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs = {
  };

  nix = {
    gc = {
      automatic = true;
      dates = "Thu *-*-* 12:45";
      options = "--delete-older-than 14d";
    };

    optimise = {
      automatic = true;
      dates = [ "Thu *-*-* 12:45" ];
    };

    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
