{ inputs, config, ... }:
{
  imports = [ inputs.sonora.homeManagerModules.default ];

  programs.sonora = {
    enable = true;
    settings = {
      font = "SF Pro Display";
      close_to_tray = false;
      tray_icon = false;
      local_folders = [ "${config.home.homeDirectory}/Music" ];

      appearance = {
        theme = "noctalia";
        adaptive_theme = false;
        rounding = "square";
        visualizer_style = "wave";
        transparent = false;
        font_size = 15.0;
        transparency = 0.0;
      };
    };
  };
}
