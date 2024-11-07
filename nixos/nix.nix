{ config, lib, pkgs, ... }:

{
  programs = {
    nix-index.enable = true;
    command-not-found.enable = false;
  };
}
