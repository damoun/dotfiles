# dotfiles

My personal dotfiles, managed with [Nix](https://nixos.org/).

## Features

- **Cross-platform**: Supports Ubuntu (via Home Manager) and macOS (via nix-darwin).
- **Declarative**: All configurations (Zsh, Tmux, Git) are written in Nix.
- **Reproducible**: Uses Flakes for dependency management.

## Installation

### Ubuntu

1. Install Nix: `curl -L https://nixos.org/nix/install | sh`
2. Apply configuration:
   ```bash
   nix run home-manager/master --extra-experimental-features 'nix-command flakes' -- switch --flake .#damoun@ubuntu
   ```

### macOS

1. Install Nix: `curl -L https://nixos.org/nix/install | sh`
2. Install [nix-darwin](https://github.com/LnL7/nix-darwin).
3. Apply configuration:
   ```bash
   darwin-rebuild switch --extra-experimental-features 'nix-command flakes' --flake .#macbook
   ```

## Structure

- `flake.nix`: Entry point.
- `modules/`: Shared Nix modules.
- `hosts/`: Host-specific configurations.
