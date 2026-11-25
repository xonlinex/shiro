{ inputs, ... }:

{
  imports = [ inputs.luciole.homeModules.default ];

  programs.luciole = {
    enable = true;

    settings = {
      browser = {
        view_mode = "grid";
        show_hidden = false;
        always_show_tab_bar = false;
        background_opacity = 0.9;
        sort_by = "modified";
        sort_descending = true;
        directories_first = true;
      };
    };
  };
}
