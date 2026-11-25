{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      autocrop
      thumbfast
      thumbfast-vanilla-osc
    ];

    scriptOpts = {
      autocrop = {
        auto = false;
        detect_round = 4; # Mantiene dimensiones limpias en múltiplos de 4
      };
    };

    config = {
      keep-open = "no";
      idle = "no";
      border-background = "blur";

      # Image quality
      profile = "high-quality";
      deband = "yes";

      # Frame interpolation
      video-sync = "display-resample";
      interpolation = "yes";
      tscale = "oversample";
    };

    bindings = {
      # Mouse wheel controls
      "WHEEL_UP" = "seek 10";
      "WHEEL_DOWN" = "seek -10";
      "WHEEL_LEFT" = "seek -10";
      "WHEEL_RIGHT" = "seek 10";
      "Shift+WHEEL_UP" = "add volume 5";
      "Shift+WHEEL_DOWN" = "add volume -5";

      # Pause
      "MBTN_MID" = "cycle pause";

      # Anime4k (low-end)
      "CTRL+0" = ''no-osd change-list glsl-shaders clr ""; show-text "GLSL shaders cleared"'';
      "CTRL+1" =
        ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_M.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode A (Fast)"'';
      "CTRL+2" =
        ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_Soft_M.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_M.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode B (Fast)"'';
      "CTRL+3" =
        ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K/Anime4K_Upscale_Denoise_CNN_x2_M.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode C (Fast)"'';
      "CTRL+4" =
        ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_M.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_S.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode A+A (Fast)"'';
      "CTRL+5" =
        ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_Soft_M.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_M.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_Soft_S.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode B+B (Fast)"'';
      "CTRL+6" =
        ''no-osd change-list glsl-shaders set "~~/shaders/Anime4K/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K/Anime4K_Upscale_Denoise_CNN_x2_M.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K/Anime4K_Restore_CNN_S.glsl:~~/shaders/Anime4K/Anime4K_Upscale_CNN_x2_S.glsl"; show-text "Anime4K: Mode C+A (Fast)"'';
    };
  };

  # Copy shaders
  xdg.configFile."mpv/shaders/Anime4K" = {
    source = ./shaders/Anime4K;
    recursive = true;
  };
}
