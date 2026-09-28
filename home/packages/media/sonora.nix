{ inputs, config, ... }:
{
  imports = [ inputs.sonora.homeManagerModules.default ];

  programs.sonora = {
    enable = true;
    settings = {
      local_folders = [ "${config.home.homeDirectory}/Music" ];

      appearance = {
        theme = "system";
        adaptive_theme = false;
        rounding = "round";
        transparent = true;
        transparency = 0.2;
      };
    };
  };
}
