{ pkgs, lib, ... }:

let
  isLinux = pkgs.stdenv.isLinux;

  # Wrap ghostty on Linux to force the 'gl' renderer, fixing EGL display errors 
  # common in GTK4 environments on some distributions.
  ghostty-pkg = if isLinux then 
    pkgs.symlinkJoin {
      name = "ghostty";
      paths = [ pkgs.ghostty ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/ghostty \
          --set GSK_RENDERER gl
      '';
    }
    else pkgs.ghostty;
in
{
  home.packages = [
    ghostty-pkg
  ];

  home.file.".config/ghostty/config".text = ''
    command = ${pkgs.tmux}/bin/tmux
    theme = dark:Dracula,light:Dracula
    font-size = 12
  '';
}
