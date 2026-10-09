{ pkgs, lib, ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      tasks.image_bound = [ 20000 20000 ];
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "l" ];
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
      ];
    };

    plugins = with pkgs.yaziPlugins; {
      full-border = {
        package = full-border;
        setup = true;
        settings = {
          type = lib.mkLuaInline "ui.Border.ROUNDED";
        };
      };

      smart-enter = {
        package = smart-enter;
        setup = true;
        settings = {
          open_multi = true;
        };
      };
    };

    theme = {
      # ember
      mgr = {
        cwd = { fg = "#d8d0c0"; italic = true; };

        hovered = { bg = "#3e3c38"; };
        preview_hovered = { bg = "#3e3c38"; };

        find_keyword = { fg = "#171311"; bg = "#c8b468"; bold = true; };
        find_position = { fg = "#80a090"; bg = "#3e3c38"; bold = true; };

        marker_copied = { fg = "#8a9868"; bg = "#8a9868"; };
        marker_cut = { fg = "#e08060"; bg = "#e08060"; };
        marker_marked = { fg = "#b07878"; bg = "#b07878"; };
        marker_selected = { fg = "#7890a0"; bg = "#7890a0"; };

        count_copied = { fg = "#171311"; bg = "#8a9868"; };
        count_cut = { fg = "#171311"; bg = "#e08060"; };
        count_selected = { fg = "#171311"; bg = "#7890a0"; };

        border_symbol = "│";
        border_style = { fg = "#73665b"; };
      };

      tabs = {
        active = { fg = "#171311"; bg = "#e08060"; };
        inactive = { fg = "#e08060"; bg = "#3e3c38"; };
      };

      mode = {
        normal_main = { fg = "#171311"; bg = "#e08060"; bold = true; };
        normal_alt = { fg = "#e08060"; bg = "#3e3c38"; };

        select_main = { fg = "#171311"; bg = "#b07878"; bold = true; };
        select_alt = { fg = "#b07878"; bg = "#3e3c38"; };

        unset_main = { fg = "#171311"; bg = "#c8b468"; bold = true; };
        unset_alt = { fg = "#c8b468"; bg = "#3e3c38"; };
      };

      status = {
        overall = { fg = "#d8d0c0"; bg = "#171311"; };
        sep_left = { open = ""; close = ""; };
        sep_right = { open = ""; close = ""; };

        progress_label = { fg = "#d8d0c0"; bold = true; };
        progress_normal = { fg = "#7890a0"; bg = "#3e3c38"; };
        progress_error = { fg = "#e08060"; bg = "#3e3c38"; };

        perm_type = { fg = "#7890a0"; };
        perm_read = { fg = "#c8b468"; };
        perm_write = { fg = "#e08060"; };
        perm_exec = { fg = "#8a9868"; };
        perm_sep = { fg = "#73665b"; };
      };

      pick = {
        border = { fg = "#73665b"; };
        active = { fg = "#d8d0c0"; bg = "#3e3c38"; };
        inactive = { fg = "#d8d0c0"; };
      };

      input = {
        border = { fg = "#80a090"; };
        title = { fg = "#80a090"; };
        value = { fg = "#b07878"; };
        selected = { bg = "#3e3c38"; };
      };

      cmp = {
        border = { fg = "#80a090"; };
        active = { fg = "#d8d0c0"; bg = "#3e3c38"; };
        inactive = { fg = "#d8d0c0"; };

        icon_file = "";      # conserva tus glyphs originales
        icon_folder = "";    # conserva tus glyphs originales
        icon_command = "";   # conserva tus glyphs originales
      };

      tasks = {
        border = { fg = "#73665b"; };
        title = { fg = "#80a090"; };
        hovered = { fg = "#d8d0c0"; bg = "#3e3c38"; };
      };

      which = {
        cols = 3;
        mask = { bg = "#171311"; };
        cand = { fg = "#80a090"; };
        rest = { fg = "#7890a0"; };
        desc = { fg = "#b07878"; };
        separator = " ➜ ";
        separator_style = { fg = "#73665b"; };
      };

      confirm = {
        border = { fg = "#80a090"; };
        title = { fg = "#80a090"; };
        content = {};
        list = {};
        btn_yes = { bg = "#3e3c38"; };
        btn_no = {};
        btn_labels = [ "  [Y]es  " "  (N)o  " ];
      };

      spot = {
        border = { fg = "#73665b"; };
        title = { fg = "#80a090"; };
      };

      notify = {
        title_info = { fg = "#80a090"; };
        title_warn = { fg = "#c8b468"; };
        title_error = { fg = "#e08060"; };

        icon_error = "";   # conserva tus glyphs originales
        icon_warn = "";    # conserva tus glyphs originales
        icon_info = "";    # conserva tus glyphs originales
      };

      help = {
        on = { fg = "#8a9868"; };
        run = { fg = "#b07878"; };
        desc = { fg = "#80a090"; };
        hovered = { bg = "#3e3c38"; };
        footer = { fg = "#d8d0c0"; bg = "#1c1b19"; };
      };

      # FIX: (tu bloque filetype comentado, con colores Ember)
      # filetype = {
      #   rules = [
      #     { mime = "image/*"; fg = "#c8b468"; }
      #     { mime = "{audio,video}/*"; fg = "#b07878"; }
      #     { mime = "application/*zip"; fg = "#e08060"; }
      #     { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}"; fg = "#e08060"; }
      #     { mime = "application/{pdf,doc,rtf,vnd.*}"; fg = "#80a090"; }
      #     { name = "*"; is = "orphan"; bg = "#e08060"; }
      #     { name = "*"; is = "exec"; fg = "#8a9868"; }
      #     { name = "*/"; fg = "#7890a0"; }
      #     { name = "*"; fg = "#d8d0c0"; }
      #   ];
      # };
    };
  };
}
