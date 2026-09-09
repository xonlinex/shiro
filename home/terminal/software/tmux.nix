{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "Space"; # Mapea Prefix a C-Space
    terminal = "tmux-256color";
    mouse = true;
    keyMode = "vi";

    # Plugins gestionados por Nix (sin necesidad de TPM)
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-dir '~/.config/tmux/resurrect'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }
    ];

    extraConfig = ''
      ### STATUS BAR ###
      set -g status-position top
      set -g status-justify "left"
      set -g status-left-length 100
      set -g status-right-length 100
      set -g status-style "bg=black,fg=default"
      set -g status-left "#[bg=magenta,fg=black]  #[bg=magenta,fg=black]#S #[fg=magenta,bg=colour8] "
      set -g status-right "#{?client_prefix,#[fg=green#,bg=default]#[bg=green#,fg=black] PREFIX ,}#[fg=blue,bg=#{?client_prefix,green,default}]#[bg=blue,fg=black] #(whoami)@#(uname -n) "

      set -g window-status-separator "#[bg=colour8,fg=black]  "
      set -g window-status-format "#[bg=colour8,fg=black]#W#{?window_end_flag,#[fg=default#,bg=colour8] ,}#{?window_end_flag,#[fg=colour8#,bg=default],}"
      set -g window-status-current-format "#[bg=colour8,fg=#{?window_zoomed_flag,yellow,white},bold]#W#{?window_end_flag,#[fg=default#,bg=colour8] ,}#{?window_end_flag,#[fg=colour8#,bg=default],}"

      ### GENERAL ###
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Terminal features
      set -ga terminal-overrides ",*:Tc"
      set -as terminal-features ",xterm-ghostty:RGB"
      set -g allow-passthrough on

      ### KEYMAPS ###
      # Split
      unbind '"'
      unbind %
      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Switch windows
      bind -n M-p previous-window
      bind -n M-n next-window

      # Move windows
      bind -n M-H swap-window -t -1\; select-window -t -1
      bind -n M-L swap-window -t +1\; select-window -t +1

      # Pane resizing
      bind -r h resize-pane -L 5
      bind -r j resize-pane -D 5
      bind -r l resize-pane -R 5
      bind -r k resize-pane -U 5

      ### PANE ###
      set -g pane-border-style fg=black
      set -g pane-border-lines single
      set -g pane-active-border-style fg=green
    '';
  };
}
