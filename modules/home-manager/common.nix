{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./gpg.nix
  ];

  home.packages = with pkgs; [
    neovim
    fzf
    jq
    htop
    tldr
    gh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
