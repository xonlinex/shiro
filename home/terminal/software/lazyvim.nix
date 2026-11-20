{ pkgs, inputs, ... }:

{
  imports = [ inputs.lazyvim.homeManagerModules.default ];

  programs.lazyvim = {
    enable = true;

    extras = {
      lang = {
        nix.enable = true;
        java.enable = true;
      };
    };

    extraPackages = with pkgs; [
      # Nix
      nil
      shfmt
      statix

      # Lua
      lua-language-server

      # Xml
      lemminx
    ];

    config = {
      keymaps = ''
        -- Tmux Navigation
        local nvim_tmux_nav = require("nvim-tmux-navigation")

        vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft) -- Navigate to the left pane
        vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown) -- Navigate to the bottom pane
        vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp) -- Navigate to the top pane
        vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight) -- Navigate to the right pane
      '';
    };

    plugins = {
      disabled = ''
        return {
          {
            "akinsho/bufferline.nvim",
            enabled = false,
          },
        }
      '';
      tmux-navigator = ''
        return {
          "alexghergh/nvim-tmux-navigation",
        }
      '';
      colorizer = ''
        return {
          "catgoose/nvim-colorizer.lua",
          event = "BufReadPre",
          opts = {
            user_default_options = {
              names = false,
            },
          },
        }
      '';
      xml-lsp = ''
        return {
          "neovim/nvim-lspconfig",
          opts = {
            servers = {
              lemminx = {},
            },
          },
        }
      '';
      snacks = ''
        return {
          "folke/snacks.nvim",
          opts = {
            dashboard = {
              preset = {
                header = [[
        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                ]],
              },
              sections = {
                { section = "header" },
                { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { section = "startup" },
              },
            },
            picker = {
              hidden = true,
              ignored = false,
              sources = {
                files = {
                  hidden = true,
                  ignored = false,
                  exclude = { "target" },
                },
                explorer = {
                  hidden = true,
                  ignored = false,
                },
              },
            },
          }
        }
      '';
      colorscheme = ''
        return {
          {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {
              style = "night",
              light_style = "day",
              transparent = true,
              styles = {
                sidebars = "transparent",
                floats = "transparent",
              },
              on_colors = function(colors)
                colors.bg_statusline = colors.none
              end,
            },
          },
          {
            "Aejkatappaja/sora",
            lazy = false,
            priority = 1000,
            opts = {
              transparent = true,
            },
          },
          {
            "ember-theme/nvim",
            name = "ember",
            priority = 1000,
            opts = {
              variant = "ember-auto",
              transparent = true,
            },
          },
          {
            "everviolet/nvim",
            name = "evergarden",
            priority = 1000,
            opts = {
              theme = {
                variant = "winter",
                accent = "green", -- MODE_VIM color
              },
              editor = {
                transparent_background = true,
              },
            },
          },
          {
            "rose-pine/neovim",
            name = "rose-pine",
            opts = {
              styles = {
                transparency = true,
              },
            },
          },
          {
            "webhooked/kanso.nvim",
            lazy = false,
            priority = 1000,
            opts = {
              transparent = true,
              background = {
                dark = "ink",
                light = "pearl",
              },
            },
          },
          {
            "LazyVim/LazyVim",
            opts = {
              colorscheme = "tokyonight",
            },
          },
        }
      '';
    };
  };
}
