{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = true;

      format = ''
        $os$username[@](white)$hostname$directory$git_branch$git_status$java$python$package$cmd_duration
        $character'';

      directory = {
        format = " [|](8) [ $path](yellow)";
        truncation_length = 1;
      };

      username = {
        format = "[$user](white)";
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname](white)";
      };

      os = {
        format = "[$symbol ](yellow)";
        disabled = false;
        symbols = {
          Arch = "󰣇";
          NixOS = "󱄅";
          Windows = "";
        };
      };

      git_branch = {
        format = " [|](8) [[ ](green)$branch](green)";
      };

      git_status = {
        format = " ([\\[$all_status$ahead_behind\\]]($style))";
        style = "red";
        conflicted = "=";
        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";
        up_to_date = "";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "X";
      };

      # java = {
      #   format = " [|](8) [${symbol}(${version})](red)";
      #   symbol = " ";
      #   version_format = "v\${raw}";
      # };

      python = {
        format = " [|](8) [\${symbol}\${pyenv_prefix}(\${version} )(\\\(\$virtualenv\\\) )]($style)";
        version_format = "v\${raw}";
        symbol = " ";
        style = "yellow";
      };

      package = {
        format = " [|](8) [ $version](yellow)";
      };

      cmd_duration = {
        min_time = 60;
        format = " [|](8) [[󰪢 ](red)$duration](fg:white)";
        disabled = false;
      };

      character = {
        success_symbol = "[>](green)";
        error_symbol = "[>](red)";
        vicmd_symbol = "[V](green bold)";
        vimcmd_replace_one_symbol = "[R](red bold)";
        vimcmd_visual_symbol = "[V](yellow bold)";
      };
    };
  };
}
