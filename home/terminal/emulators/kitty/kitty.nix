{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "ZedMono Nerd Font";
      size = 17.0;
    };

    settings = {
      scrollback_lines = 10000;
      background_opacity = "0.9";
      window_padding_width = 15;
      confirm_os_window_close = 0;

      # Cursor
      cursor_shape = "beam";
      cursor_beam_thickness = 1.5;
      cursor_blink_interval = 1;
      cursor_trail = 1;
      custom_shaders = "lightning-custom";
    };
    extraConfig = ''
      include ./themes/jellybeans.conf
      '';
  };
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
