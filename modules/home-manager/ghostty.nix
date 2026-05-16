{ pkgs, ... }:

{
  home.packages = [
    pkgs.ghostty
  ];

  home.file.".config/ghostty/config".text = ''
    command = ${pkgs.tmux}/bin/tmux
    theme = dark:Dracula,light:Dracula
    font-size = 12
  '';
}
