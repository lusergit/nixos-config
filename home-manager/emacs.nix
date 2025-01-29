{ pkgs, lib, ... }:
let
  language-servers = with pkgs; [
    lexical
    next-ls
    elixir-ls
    gcc
  ];
  emacsBasePackage = (pkgs.emacsPackagesFor pkgs.emacs-pgtk).emacsWithPackages (epkgs: with epkgs; [
        vterm
        treesit-grammars.with-all-grammars
  ]);
in
{

  programs.emacs = {
    enable = true;
    package = (
      pkgs.symlinkJoin {
        name = "${lib.getName emacsBasePackage}-wrapped-${lib.getVersion emacsBasePackage}";
        paths = [ emacsBasePackage ];
        preferLocalBuild = true;
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/emacs \
            --prefix PATH : ${lib.makeBinPath language-servers}
        '';
      }
    );
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
  };
}
