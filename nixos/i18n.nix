{
  ...
}:

{
  config.i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "it_IT.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_TIME = "it_IT.UTF-8";
      LC_MONETARY = "it_IT.UTF-8";
      LC_PAPER = "it_IT.UTF-8";
      LC_TELEPHONE = "it_IT.UTF-8";
      LC_MEASUREMENT = "it_IT.UTF-8";
    };
  };
}
