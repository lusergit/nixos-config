{ pkgs, ... }:
{
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;

      config.global = {
        bash_path = "${pkgs.bash}/bin/bash";
        load_dotenv = true;
        warn_timeout = 0;
      };
    };

    git = {
      enable = true;
      difftastic.enable = true;
      ignores = [
        "log/"
        ".direnv/"
        ".nix-mix/"
        ".nix-hex/"
        ".envrc"
        ".env"
        ".venv"
        ".vscode/"
        "result"
        ".elixir_ls/"
        ".lexical/"
        ".helix"
        ".project"
      ];
      extraConfig = {
        credential.helper = "store";
        diff.algorithm = "histogram";
        fetch.prune = true;
        fetch.prunetags = true;
        github.user = "lusergit";
        init.defaultBranch = "main";
        log.date = "iso";
        merge.confilictStyle = "zdiff3";
        pull.ff = "only";
        pull.rebase = "interactive";
        push.autoSetupRemote = true;
        rebase.autosquash = true;
        rebase.autostash = true;
        rebase.updateRefs = true;
        rerere.enabled = true;
        core.editor = "emacsclient -c";

        user = {
          name = "Luca Zaninotto";
          email = "luca.zaninotto@secomind.com";
          signingKey = "F3F89DB4BABF8C77";
        };
        commit.gpgSign = true;
        tag.gpgSign = true;
      };
    };
  };
}
