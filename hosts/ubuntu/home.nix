{ ... }:

{
  imports = [
    ../../modules/home-manager/common.nix
  ];

  home.username = "damoun";
  home.homeDirectory = "/home/damoun";
  home.stateVersion = "24.05";
}
