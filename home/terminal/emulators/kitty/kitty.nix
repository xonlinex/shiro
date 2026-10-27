{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "Maple Mono NF";
      size = 14.0;
    };

    settings = {
      scrollback_lines = 10000;
      background_opacity = "1.0";
      window_padding_width = 10;
      confirm_os_window_close = 0;

      # Cursor
      cursor_shape = "beam";
      cursor_beam_thickness = 1.5;
      cursor_blink_interval = 1;
      cursor_trail = 1;
      custom_shaders = "lightning-custom";
    };
    keybindings = {
# Prefijo: Ctrl+Space (evita chocar con Ctrl+A de readline)
      "ctrl+space>c" = "new_tab_with_cwd";
      "ctrl+space>n" = "next_tab";
      "ctrl+space>p" = "previous_tab";

# Splits: vsplit = a la derecha, hsplit = debajo
      "ctrl+space>v" = "launch --location=vsplit --cwd=current";
      "ctrl+space>s" = "launch --location=hsplit --cwd=current";

# Moverse entre paneles
      "ctrl+space>h" = "neighboring_window left";
      "ctrl+space>j" = "neighboring_window bottom";
      "ctrl+space>k" = "neighboring_window top";
      "ctrl+space>l" = "neighboring_window right";

      "ctrl+space>z" = "toggle_layout stack";        # zoom
        "ctrl+space>r" = "start_resizing_window";
      "ctrl+space>x" = "close_window";
      "ctrl+space>e" = "show_scrollback";

      "ctrl+space>1" = "goto_tab 1";
      "ctrl+space>2" = "goto_tab 2";
      "ctrl+space>3" = "goto_tab 3";
    };

  };

  # theme dark/light
  xdg.configFile."kitty/dark-theme.auto.conf".source = ./themes/ember/ember.conf;
  xdg.configFile."kitty/light-theme.auto.conf".source = ./themes/ember/ember-light.conf;
  xdg.configFile."kitty/no-preference-theme.auto.conf".source = ./themes/ember/ember.conf;

  # Import themes
  xdg.configFile."kitty/themes" = {
    source = ./themes;
    recursive = true;
  };

  xdg.configFile."kitty/shaders/lightning-custom.pipeline".text = ''
    startgroup
      var float3 BOLT_COLOR = float3(0.638, 0.181, 0.156)
      var float3 GLOW_COLOR = float3(0.320, 0.090, 0.078)
      var float  DURATION = 0.12
      var float CORE_WIDTH = 1.5
      var float JAGGEDNESS = 0.12
      shaders cursor-trail-lightning
    endgroup
  '';
}
