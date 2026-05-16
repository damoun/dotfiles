{ pkgs, lib, config, ... }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in
{
  programs.zsh = {
    enable = true;
    dotDir = config.home.homeDirectory;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
    };

    shellAliases = {
      http = "python -m SimpleHTTPServer";
      reload = "source ~/.zshenv && source ~/.zshrc";
      "rec" = "script -aq ~/term.log-$(date '+%Y%m%d-%H-%M')";
    };

    initContent = lib.mkMerge [
      (lib.mkBefore ''
        export ZSH_CACHE_DIR="$HOME/.cache/zsh"
        mkdir -p "$ZSH_CACHE_DIR/completions"

        autoload -Uz compinit
        compinit
        skip_global_compinit=1
      '')
      ''
        # Functions
        timezsh() {
          shell=''${1-$SHELL}
          for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
        }

        sshmulti() {
          if [ -z "$1" ]; then
            echo "please supply at least one server to connect to" >&2
            exit 1
          fi

          target=multi-ssh-$PPID

          if [ -z "$TMUX" ]; then
              tmux new-session -d -s "$target"
          fi

          tmux new-window -n "$target" "ssh $1"
          shift

          for host in "$@"; do
              tmux split-window -t ":$target" -h "ssh $host"
              tmux select-layout -t ":$target" tiled #> /dev/null
          done

          tmux select-pane -t ":$target"
          tmux set-window-option -t ":$target" synchronize-panes on #>/dev/null

          if [ -z "$TMUX" ]; then
              tmux attach-session -d -t ":$target"
          fi
        }

        # Extra env vars from zshenv (some might be better in sessionVariables)
        export REPORTTIME="3"
        export TOUCHBAR_GIT_ENABLED="true"
        export ZSH_DISABLE_COMPFIX="false"
        export YSU_MESSAGE_POSITION="after"
        export ANSIBLE_NOCOWS=1

        # Use GPG Agent for SSH
        export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      ''
    ];

    sessionVariables = {
      EDITOR = "nvim";
      ZSH_CACHE_DIR = "$HOME/.cache/zsh";
    };

    antidote = {
      enable = true;
      plugins = [
        "ohmyzsh/ohmyzsh path:lib"
        "ohmyzsh/ohmyzsh path:plugins/1password"
        "ohmyzsh/ohmyzsh path:plugins/aliases"
        "ohmyzsh/ohmyzsh path:plugins/ansible"
        "ohmyzsh/ohmyzsh path:plugins/battery"
        "ohmyzsh/ohmyzsh path:plugins/capistrano"
        "ohmyzsh/ohmyzsh path:plugins/command-not-found"
        "ohmyzsh/ohmyzsh path:plugins/cp"
        "ohmyzsh/ohmyzsh path:plugins/docker"
        "ohmyzsh/ohmyzsh path:plugins/extract"
        "ohmyzsh/ohmyzsh path:plugins/gcloud"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/github"
        "ohmyzsh/ohmyzsh path:plugins/gitignore"
        "ohmyzsh/ohmyzsh path:plugins/history"
        "ohmyzsh/ohmyzsh path:plugins/rsync"
        "ohmyzsh/ohmyzsh path:plugins/sudo"
        "ohmyzsh/ohmyzsh path:plugins/terraform"
        "ohmyzsh/ohmyzsh path:plugins/tmux"
        "ohmyzsh/ohmyzsh path:plugins/urltools"
        "ohmyzsh/ohmyzsh path:plugins/vagrant"
        "ohmyzsh/ohmyzsh path:plugins/kubectl"
        "ohmyzsh/ohmyzsh path:plugins/fluxcd"
        "dracula/zsh"
        "MichaelAquilina/zsh-you-should-use"
        "zsh-users/zsh-history-substring-search"
      ] 
      ++ lib.optionals isDarwin [
        "ohmyzsh/ohmyzsh path:plugins/brew"
        "ohmyzsh/ohmyzsh path:plugins/macos"
      ]
      ++ lib.optionals isLinux [
        "ohmyzsh/ohmyzsh path:plugins/debian"
      ];
    };
  };
}
