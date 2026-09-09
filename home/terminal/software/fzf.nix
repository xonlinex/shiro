{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    # Deshabilita el atajo Ctrl+R de fzf para evitar el conflicto con Atuin
    historyWidget.command = "";

    colors = {
      "bg+" = "#201b19";
      bg = "#171311";
      border = "#362f2c";
      fg = "#a09384";
      "fg+" = "#e6d5c2";
      gutter = "#171311";
      header = "#4e89a2";
      hl = "#ea9875";
      "hl+" = "#fcba81";
      info = "#73665b";
      marker = "#43b16a";
      pointer = "#ea9875";
      prompt = "#d1766e";
      query = "#e6d5c2";
      scrollbar = "#362f2c";
      spinner = "#ea9875";
    };
  };
}
