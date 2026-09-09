{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza --icons --group-directories-first -l";
      la = "eza --icons --group-directories-first -la";
      lt = "eza --icons --group-directories-first -T";
      tree = "eza --icons -T";
      cat = "bat";
      ff = "fastfetch";
    };

    shellAbbrs = {
      hms = "home-manager switch --flake .#${config.home.username}";
      nrs = "sudo nixos-rebuild switch --flake .#nixos";
      c = "clear";
      p = "python";
      g = "git";
      gcl = "git clone";
      gst = "git status";
    };

    functions = {
      auto_venv = {
        onVariable = "PWD";
        body = ''
          if test -f .venv/bin/activate.fish
              source .venv/bin/activate.fish
          else if set -q VIRTUAL_ENV
              deactivate
          end
        '';
      };
    };

    interactiveShellInit = ''
      set fish_greeting ""

      # Enable vim_mode
      set -g fish_key_bindings fish_vi_key_bindings
      fish_vi_key_bindings
    '';
  };
}
