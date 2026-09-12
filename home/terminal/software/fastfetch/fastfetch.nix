{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        source = "nixos_small";
        type = "builtin";
        padding = {
          top = 1;
          right = 4;
          left = 4;
        };
      };

      display = {
        separator = "  ";
      };

      modules = [
        "break"
        {
          type = "os";
          key = "  OS      ";
          format = "{3}";
          keyColor = "red";
        }
        {
          type =  "kernel";
          key =  "  Kernel  ";
          format = "{2}";
          keyColor = "red";
        }
        {
          type = "cpu";
          format = "{1} @ {7}";
          key = "  CPU     ";
          keyColor = "blue";
        }
        {
          type = "gpu";
          format = "{1} {2}";
          key = "󰊴  GPU     ";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = "  Memory  ";
          keyColor = "magenta";
        }
        {
          type = "terminal";
          key = "  Terminal";
          keyColor = "yellow";
        }
        {
          type = "wm";
          key = "  WM      ";
          format = "{2} ({3})";
          keyColor = "green";
        }
        # {
        #   type = "uptime";
        #   key = "󱫐  Uptime  ";
        #   keyColor = "red";
        # }
        "break"
        # {
        #   type = "colors";
        #   paddingLeft = 0;
        #   symbol = "circle";
        # }
      ];
    };
  };
}
