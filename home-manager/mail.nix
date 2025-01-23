{ ... }:

{
  programs.thunderbird = {
    enable = true;
    profiles = {
      luser = {
        isDefault = true;
      };
    };
  };
}
