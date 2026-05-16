{ ... }:

{
  imports = [
    ../../modules/home-manager/common.nix
    ../../modules/home-manager/kubernetes.nix
    ../../modules/home-manager/infrastructure.nix
    ../../modules/home-manager/development.nix
  ];

  home.username = "damoun";
  home.homeDirectory = "/home/damoun";
  home.stateVersion = "24.05";
}
