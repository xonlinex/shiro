{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

    # Disable the fzf Ctrl+R shortcut to avoid a conflict with Atuin.
    historyWidget.command = "";

    # Ember colors
    defaultOptions = [
      "--height=~40%"
      "--highlight-line"
      "--info=inline-right"
      "--ansi"
      "--layout=reverse"
      "--border=rounded"
      "--color=bg+:#3e3c38"
      "--color=bg:-1"
      "--color=border:#73665b"
      "--color=fg:#d8d0c0"
      "--color=fg+:#d8d0c0"
      "--color=gutter:#171311"
      "--color=header:#c8b468"
      "--color=hl+:#e08060"
      "--color=hl:#e08060"
      "--color=info:#73665b"
      "--color=marker:#e08060"
      "--color=pointer:#e08060"
      "--color=prompt:#e08060"
      "--color=query:#d8d0c0:regular"
      "--color=scrollbar:#73665b"
      "--color=separator:#73665b"
      "--color=spinner:#8a9868"
    ];
  };
}
