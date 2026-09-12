{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    # Fuentes
    font = {
      name = "Victor Mono Nerd Font";
      size = 15.0;
    };

    # Tema o colores (puedes usar un tema integrado de nixpkgs o definir colores a mano)
    # themeFile = "Catppuccin-Mocha"; # Opciones populares: Tokyonight-Night, Gruvbox-Dark, etc.

    # Opciones de configuración generales
    settings = {
      # Renderizado e integración
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      scrollback_lines = 10000;

      # Apariencia y Transparencia
      background_opacity = "1.00";
      window_padding_width = 10;
      hide_window_decorations = "yes";

      # Formato de Pestañas (Tabs)
      # tab_bar_edge = "top";
      # tab_bar_style = "powerline";
      # tab_powerline_style = "slanted";
      # active_tab_font_style = "bold";

      # Cursor
      cursor_shape = "beam";
      cursor_beam_thickness =  1.5;
      cursor_blink_interval = 1;
      cursor_trail = 8;
      shell_integration = "no-cursor";
    };

    # Atajos de teclado (Keybindings)
    # keybindings = {
    #   # Gestión de Pestañas
    #   "ctrl+shift+t" = "new_tab";
    #   "ctrl+shift+q" = "close_tab";
    #   "ctrl+page_up" = "previous_tab";
    #   "ctrl+page_down" = "next_tab";
    #
    #   # Modificar tamaño de fuente
    #   "ctrl+plus" = "change_font_size all +1.0";
    #   "ctrl+minus" = "change_font_size all -1.0";
    #   "ctrl+0" = "change_font_size all 0";
    #
    #   # Copiar / Pegar
    #   "ctrl+shift+c" = "copy_to_clipboard";
    #   "ctrl+shift+v" = "paste_from_clipboard";
    # };
  };
}
