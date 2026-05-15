{ pkgs, ... }:

let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  programs.gpg = {
    enable = true;
    scdaemonSettings = {
      disable-ccid = true; # Often needed on macOS to use native YubiKey drivers
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    
    # Use native pinentry for macOS, curses for Linux
    pinentry.package = if isDarwin then pkgs.pinentry_mac else pkgs.pinentry-curses;
    
    # Default cache time for normal GPG usage
    defaultCacheTtl = 3600;
    maxCacheTtl = 86400;
  };
}
