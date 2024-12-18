{ ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      background-package = super.stdenvNoCC.mkDerivation {
        name = "background-package";
        src = ../wallpapers;
        dontUnpack = true;
        installPhase = ''
          cp -r $src $out
        '';
      };
    })
  ];
}
