{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/gpg.nix
  ];

  # home.username is set by nix-darwin if using the module usually,
  # but it's good to be explicit or let it be passed.
  home.username = "damoun";
  home.homeDirectory = "/Users/damoun";

  home.packages = with pkgs; [
    neovim
    fzf
    jq
    htop
    tldr
  ];

  home.stateVersion = "24.05";
}
