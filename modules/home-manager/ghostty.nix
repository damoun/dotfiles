{ pkgs, ... }:

let
  # This is the version that the user said worked for the UI.
  ghostty-wrapped = pkgs.symlinkJoin {
    name = "ghostty";
    paths = [ pkgs.ghostty ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/ghostty \
        --set GSK_RENDERER gl
    '';
  };
in
{
  home.packages = [
    ghostty-wrapped
  ];

  home.file.".config/ghostty/config".text = ''
    command = ${pkgs.tmux}/bin/tmux
    theme = dark:Dracula,light:Dracula
    font-size = 12
  '';
}
