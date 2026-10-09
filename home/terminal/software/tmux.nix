{ pkgs, ... }:

let
  main = "#e08060";
  muted = "#b8ac96";
in
{
  programs.tmux = {
    enable = true;
    shortcut = "Space"; # Prefix Ctrl+Space
    terminal = "tmux-256color";
    mouse = true;
    keyMode = "vi";

    # Plugins con NIX
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
        '';
      }
    ];

    extraConfig = ''
      ### STATUS BAR ###
      set -g status-position top
      set -g status-justify "left"
      set -g status-left-length 100
      set -g status-right-length 100
      set -g status-style "bg=default,fg=${muted}"
      set -g status-left "#[bg=${main},fg=black]  #[bg=${main},fg=black]#S #[fg=${main},bg=default] "
      set -g status-right "#{?client_prefix,#[fg=${main},bg=default]#[bg=${main},fg=black,bold] PREFIX ,}#[fg=${muted},bg=#{?client_prefix,${main},default}]#[bg=${muted},fg=black] #(whoami)@#(uname -n) "

      set -g window-status-separator "#[fg=${muted}]  "
      set -g window-status-format "#[fg=${muted}]#W#{?window_end_flag, ,}"
      set -g window-status-current-format "#[fg=${main},bold]#W#{?window_end_flag, ,}"

      ### GENERAL ###
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Terminal features
      set -ga terminal-overrides ",*:Tc"
      set -as terminal-features ",xterm-ghostty:RGB"
      set -g allow-passthrough on

      ### SESH ###
      set -g detach-on-destroy off

      # Prefix + T: Selector flotante con FZF
      bind-key "T" run-shell "sesh connect \"$( \
        sesh list --icons | fzf-tmux -p 80%,70% \
          --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
          --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
          --bind 'tab:down,btab:up' \
          --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
          --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
          --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
          --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
          --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
          --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
          --preview-window 'right:55%' \
          --preview 'sesh preview {}' \
      )\""

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
      set -g pane-border-style fg=${muted}
      set -g pane-border-lines single
      set -g pane-active-border-style fg=${main}
    '';
  };
}
