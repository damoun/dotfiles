{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Damien Plénard";
    userEmail = "damien@plenard.me";
    
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      # Include specific config for work projects if directory exists
      includeIf."gitdir:~/Projects/molops.io/".path = "~/Projects/molops.io/gitconfig";
    };

    ignores = [
      # Mac OS
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      "Icon"
      "._*"
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"
    ];
  };
}
