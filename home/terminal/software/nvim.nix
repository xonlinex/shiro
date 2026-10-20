{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    ### REQUIRED PACKAGES ###

    # Lua
    lua-language-server
    stylua
    shfmt

    # Java + Spring Boot
    python3

    # Nix
    nixd
    nixfmt
  ];

}
