{ pkgs, inputs, ... }:
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
        remember_window_size = "no";
        initial_window_width = "100c";
        initial_window_height = "30c";
      };
      shellIntegration = {
        mode = "no-cursor";
      };
      themeFile = "Modus_Vivendi";
    };

    ghostty = {
      # package = inputs.ghostty.packages.${pkgs.system}.default;
      enable = true;

      themes = {
        modus-vivendi = {
          palette = [
            "0=#1e1e1e"
            "8=#535353"
            "1=#ff5f59"
            "9=#ff7f9f"
            "2=#44bc44"
            "10=#00c06f"
            "3=#d0bc00"
            "11=#dfaf7a"
            "4=#2fafff"
            "12=#00bcff"
            "5=#feacd0"
            "13=#b6a0ff"
            "6=#00d3d0"
            "14=#6ae4b9"
            "7=#ffffff"
            "15=#989898"
          ];
          background = "#000000";
          foreground = "#ffffff";
          selection-background = "#5a5a5a";
          selection-foreground = "#ffffff";
          cursor-color = "#ffffff";
        };
        modus-operandi = {
          palette = [
            "0=#f2f2f2"
            "1=#a60000"
            "2=#006800"
            "3=#6f5500"
            "4=#0031a9"
            "5=#721045"
            "6=#005e8b"
            "7=#000000"
            "8=#c4c4c4"
            "9=#a0132f"
            "10=#00663f"
            "11=#7a4f2f"
            "12=#0000b0"
            "13=#531ab6"
            "14=#005f5f"
            "15=#595959"
          ];
          background = "#ffffff";
          foreground = "#000000";
          selection-background = "#bdbdbd";
          selection-foreground = "#000000";
          cursor-color = "#000000";
        };
      };
      settings = {
        theme = "dark:modus-vivendi,light:modus-operandi";
        shell-integration-features = "no-cursor";
        cursor-style = "block";
        window-theme = "ghostty";
        window-height = 60;
        window-width = 200;
        font-size = 18;
      };
    };

    atuin = {
      enable = true;
    };
  };
}
