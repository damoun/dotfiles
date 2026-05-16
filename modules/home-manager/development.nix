{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pre-commit
    python3
    nodejs
    go
  ];
}
