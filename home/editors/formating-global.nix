{ ... }:
{
  home.file.".editorconfig".text = ''
    [*]
    charset = utf-8
    end_of_line = lf
    insert_final_newline = true
    trim_trailing_whitespace = true
    indent_style = space
    indent_size = 4
    max_line_length = 120

    [*.lua]
    indent_style = space
    indent_size = 2

    [*.{xml}]
    indent_style = space
    indent_size = 2

    [*.{yaml,yml,json}]
    indent_style = space
    indent_size = 2

    [*.{c,cpp,h,hpp}]
    indent_style = space
    indent_size = 2
    
    [*.nix]
    indent_style = space
    indent_size = 2
  '';
}
