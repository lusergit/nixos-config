{
  config,
  lib,
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [ cascadia-code ];
}