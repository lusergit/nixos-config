{ pkgs, ... }:
{
  programs = {
    bash.enable = true;
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
        ".projectile"
        ".venv/"
        "pyenv/"
        ".vscode/"
        "result"
        ".elixir_ls/"
        ".lexical/"
        ".helix"
        ".project"
      ];
      aliases = {
        fpush = "push --force-with-lease";
        adog = "log --all --decorate --oneline --graph";
      };
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

    kitty = {
      enable = true;
      font = {
        name = "Cascadia Code NF";
        size = 16;
      };
      settings = {
        cursor_shape = "block";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
      };
      shellIntegration = {
        mode = "no-cursor";
      };
      themeFile = "Modus_Vivendi";
    };

    atuin = {
      enable = true;
    };
  };
}
