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
  # Create a dedicated launcher script for Ghostty on Linux to handle nixGL and environment.
  ghostty-launcher = pkgs.writeShellScriptBin "ghostty-launcher" ''
    # Source nix profiles to ensure 'nix' and other tools are in PATH
    if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
      . "$HOME/.nix-profile/etc/profile.d/nix.sh"
    elif [ -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh ]; then
      . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
    fi

    export NIXPKGS_ALLOW_UNFREE=1
    export GSK_RENDERER=gl
    
    # Execute ghostty via nixGL
    exec /nix/var/nix/profiles/default/bin/nix run --impure github:nix-community/nixGL#nixGLNvidia -- ghostty "$@"
  '';
in
{
  home.packages = [
    ghostty-pkg
    (lib.mkIf isLinux ghostty-launcher)
  ];

  home.file.".config/ghostty/config".text = ''
    command = ${pkgs.tmux}/bin/tmux
    theme = dark:Dracula,light:Dracula
    font-size = 12
  '';

  # Enable XDG desktop entries to support launching from the Ubuntu dock
  xdg.enable = true;
  xdg.desktopEntries."com.mitchellh.ghostty" = lib.mkIf isLinux {
    name = "Ghostty";
    genericName = "Terminal Emulator";
    exec = "${ghostty-launcher}/bin/ghostty-launcher";
    icon = "com.mitchellh.ghostty";
    terminal = false;
    categories = [ "System" "TerminalEmulator" ];
    comment = "Ghostty terminal via nixGL";
    settings = {
      StartupWMClass = "com.mitchellh.ghostty";
    };
  };
}
