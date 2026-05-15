{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    historyLimit = 1000;
    terminal = "screen-256color";
    
    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-plugins "battery cpu-usage ram-usage time"
          set -g @dracula-military-time true
        '';
      }
    ];

    extraConfig = ''
      set -g display-time 3000
    '';
  };
}
