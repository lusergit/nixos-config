# Configure GPG and the GPG agent to use with home-manager
{ config, pkgs, ... }:
{
  config = {
    programs.gpg = {
      enable = true;
      settings = {
        use-agent = true;
      };
    };
    services.gpg-agent = {
      enable = true;
      enableExtraSocket = true;
      enableSshSupport = true;
      defaultCacheTtl = 3600;
      maxCacheTtl = 60480000;
      defaultCacheTtlSsh = 3600;
      maxCacheTtlSsh = 60480000;
      pinentryPackage = pkgs.pinentry-qt;
    };
  };
}
