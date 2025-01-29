{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  config.nixpkgs.overlays = [
    (
      self: super:
      let
        mattermost-desktop = config.lib.config.wrapElectronWayland super.mattermost-desktop;

        background-package = super.stdenvNoCC.mkDerivation {
          name = "background-package";
          src = ../wallpapers;
          dontUnpack = true;
          installPhase = ''
            cp -r $src $out
          '';
        };

      in
      {
        inherit background-package mattermost-desktop;
      }
    )

    inputs.emacs-overlay.overlays.default
  ];

  config = {
    lib.config = {
      wrapElectronWayland =
        derivation:
        let
          name = lib.strings.getName derivation;
          fullExe = lib.getExe derivation;
          exe = builtins.baseNameOf (lib.getExe derivation);
        in
        pkgs.symlinkJoin {
          name = "${name}-wayland";
          paths = [ derivation ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram "$out/bin/${exe}" \
              --set NIXOS_OZONE_WL 1

            filesWithRefs=$(grep -wl '${fullExe}' -r '${derivation}')
            for f in "$filesWithRefs"; do
              file="''${f#${derivation}}"

              rm "$out/$file"

              substitute "$f" "$out/$file" \
                --replace-fail '${fullExe}' "$out/bin/${exe}"
            done
          '';
        };
    };
  };
}
