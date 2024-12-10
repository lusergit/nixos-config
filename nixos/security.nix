{
  ...
}:

{
  security = {
    rtkit.enable = true;
    pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };

    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
  };
}
