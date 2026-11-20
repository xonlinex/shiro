{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

    # Disable history (Ctrl+R) to avoid conflict with Atuin
    historyWidget.command = "";

    defaultOptions = [
      "--height=~40%"
      "--highlight-line"
      "--info=inline-right"
      "--ansi"
      "--layout=reverse"
      "--border=rounded"
      "--color=16"
    ];

    colors = {
      bg = "-1";
      "bg+" = "0";
      fg = "-1";
      "fg+" = "15";
      hl = "4";
      "hl+" = "12";
      info = "3";
      prompt = "5";
      pointer = "4";
      marker = "2";
      spinner = "6";
      header = "6";
      border = "8";
    };
  };
}
