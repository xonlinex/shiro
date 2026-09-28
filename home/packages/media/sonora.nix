{ inputs, config, ... }:
{
  imports = [ inputs.sonora.homeManagerModules.default ];

  programs.sonora = {
    enable = true;
    settings = {
      local_folders = [ "${config.home.homeDirectory}/Music" ];

      appearance = {
        theme = "dark";
        adaptive_theme = false;
        transparent = true;
        transparency = 0.20;
      };
    };
  };
}
