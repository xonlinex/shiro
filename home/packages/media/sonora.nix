{ inputs, config, ... }:
{
  imports = [ inputs.sonora.homeManagerModules.default ];

  programs.sonora = {
    enable = true;
    settings = {
      local_folders = [ "${config.home.homeDirectory}/Music" ];

      appearance = {
        theme = "system";
        adaptive_theme = true;
        rounding = "round";
        transparent = false;
        transparency = 0.2;
      };
    };
  };
}
