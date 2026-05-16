{ pkgs, inputs, ... }:

{
  imports = [
    ./ghostty.nix
    ./gemini.nix
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
    inputs.pass-cli.packages.${pkgs.system}.default
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
