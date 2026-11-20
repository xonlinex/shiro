{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

    # Desactiva el historial (Ctrl+R) para evitar conflicto con Atuin
    historyWidget.command = "";

    defaultOptions = [
      "--height=~40%"
      "--highlight-line"
      "--info=inline-right"
      "--ansi"
      "--layout=reverse"
      "--border=rounded"
      "--color=16" # Fuerza a fzf a usar la paleta de 16 colores de tu terminal
    ];

    # Mapeo opcional a los índices ANSI de tu terminal (0-15) para un estilo moderno
    colors = {
      bg = "-1"; # Transparente (usa el fondo de tu terminal)
      "bg+" = "0"; # Negro brillante / Selección sutil (color 0 o 8 según tu tema)
      fg = "-1"; # Texto normal de tu terminal
      "fg+" = "15"; # Blanco brillante para la línea seleccionada
      hl = "4"; # Azul (coincidencias)
      "hl+" = "12"; # Azul brillante (coincidencia en línea activa)
      info = "3"; # Amarillo (contador de resultados)
      prompt = "5"; # Magenta (símbolo >)
      pointer = "1"; # Rojo (indicador de línea)
      marker = "2"; # Verde (elementos marcados con Tab)
      spinner = "6"; # Cian
      header = "6"; # Cian
      border = "8"; # Gris / Negro brillante para el borde redondeado
    };
  };
}
