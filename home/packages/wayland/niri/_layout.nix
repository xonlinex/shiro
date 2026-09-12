{
  prefer-no-csd = {};

  hotkey-overlay = {
    skip-at-startup = {};
    hide-not-bound = {};
  };

  animations = {
    on = {};
    slowdown = 0.8;
  };

  blur = {
    passes = 3;
    offset = 3.0;
    noise = 0.03;
    saturation = 1.5;
  };

  layout = {
    gaps = 10;
    center-focused-column = "on-overflow";
    always-center-single-column = {};
    default-column-width = {
      proportion = 0.5;
    };
    background-color = "#000000";

    focus-ring.off = {};

    border = {
      on = {};
      width = 2;
      active-color = "#F7DCDE39";
      inactive-color = "#A58A8D39";
    };

    shadow = {
      off = {};
      softness = 20;
      spread = 3;
      draw-behind-window = false;
      color = "#00000070";
      inactive-color = "#00000035";
    };

    tab-indicator = {
      width = 5;
      gap = 5;
      length._props = {
        total-proportion = 0.5;
      };
      position = "top";
      place-within-column = {};
      gaps-between-tabs = 5;
      corner-radius = 10;
    };
  };

  overview = {
    zoom = 0.75;
    workspace-shadow.on = {};
  };

  recent-windows = {
    highlight = {
      padding = 20;
      corner-radius = 14;
    };
    previews = {
      max-height = 500;
      max-scale = 0.5;
    };
    binds = {
      "Alt+Tab".next-window = {};
      "Alt+Shift+Tab".previous-window = {};
      "Alt+Escape".next-window._props = { filter = "app-id"; };
      "Alt+Shift+Escape".previous-window._props = { filter = "app-id"; };
    };
  };

  cursor = {
    xcursor-theme = "Bibata-Modern-Classic";
    xcursor-size = 24;
    hide-when-typing = {};
    hide-after-inactive-ms = 5000;
  };
}
