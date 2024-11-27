{
  config,
  lib,
  pkgs,
  ...
}:

{
  security = {
    rtkit.enable = true;
    pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };
  };
}
