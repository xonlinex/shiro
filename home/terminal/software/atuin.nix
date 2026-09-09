{ pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    flags = [ "--disable-up-arrow" ];

    themes = {
      cendre = {
        theme.name = "cendre";
        colors = {
          AlertInfo = "#43b16a";
          AlertWarn = "#fcba81";
          AlertError = "#d25780";
          Annotation = "#8bcfff";
          Base = "#e6d5c2";
          Guidance = "#a09384";
          Important = "#ea9875";
          Title = "#9480ba";
        };
      };
    };

    settings = {
      style = "full";
      theme.name = "cendre";
    };
  };
}
