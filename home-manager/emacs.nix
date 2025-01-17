{ pkgs, lib, ... }:
{

  programs.emacs = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "${lib.getName pkgs.emacs}-wrapped-${lib.getVersion pkgs.emacs}";
      paths = [ pkgs.emacs ];
      preferLocalBuild = true;
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/emacs \
          --prefix PATH : ${lib.makeBinPath [ pkgs.lexical ]}
      '';
    };
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
  };
}
