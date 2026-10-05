{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;
      # scan_timeout = 5;
      # command_timeout = 500;

      format = ''
        $directory$git_branch$git_status$cmd_duration$nix_shell
        $character'';

      # status = {
      #   disabled = false;
      #   format = "[$symbol](bold $style) ";
      #   symbol = "│";
      #   success_symbol = "[│](bold white)";
      #   style = "red";
      #   map_symbol = false;
      #   recognize_signal_code = false;
      #   pipestatus = false;
      # };
      os = {
        format = "[$symbol ](blue)";
        disabled = false;
        symbols = {
          Arch = "󰣇";
          NixOS = "󱄅";
          Windows = "";
        };
      };

      character = {
        # format = ''[╰─$symbol](8) '';
        success_symbol = "[](green)";
        error_symbol = "[](red)";
        vicmd_symbol = "[V](green bold)";
        vimcmd_replace_one_symbol = "[R](red bold)";
        vimcmd_visual_symbol = "[V](yellow bold)";
      };

      jobs.disabled = true;

      username = {
        format = "[$user]($style)@";
        style_user = "bold blue";
        show_always = true;
      };

      hostname = {
        format = "[$hostname]($style) ";
        style = "bold blue";
        ssh_only = false;
      };

      directory = {
        format = "[$path]($style) ";
        style = "bold yellow";
        truncation_length = 1;
        truncation_symbol = "";
        home_symbol = "~";
        # repo_root_format = "[$repo_root]($repo_root_style)";
        # repo_root_style = "bold white";
      };

      git_branch = {
        format = "[on ](white)[ $branch]($style)";
        style = "green";
        symbol = "";
      };

      git_status = {
        format = " ([\\[$all_status$ahead_behind\\]]($style)) ";
        style = "red";
        conflicted = "=";
        ahead = "↑";
        behind = "↓";
        diverged = "↕";
        up_to_date = "";
        untracked = "?";
        stashed = "";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "x";
      };

      cmd_duration = {
        format = "[took ](white)[$duration]($style)";
        style = "yellow";
        min_time = 2000;
        show_milliseconds = true;
      };

      nix_shell = {
        disabled = false;
        heuristic = false;
        format = " [nix]($style)";
        style = "bold blue";
        impure_msg = "";
        pure_msg = "";
        unknown_msg = "";
      };
    };
  };
}
