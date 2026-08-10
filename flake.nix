{
  description = "Mi configuración completa de NixOS + Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qylock.url = "github:Darkkal44/qylock";
    import-tree.url = "github:vic/import-tree";
  };

    outputs = { nixpkgs, home-manager, noctalia,zen-browser, firefox-addons, qylock, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
  {
  # Configuración del sistema (equivalente a /etc/nixos)
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        qylock.nixosModules.default
        ./hosts/nixos/configuration.nix
      ];
    };

    # Configuración de usuario (Home Manager standalone)
    homeConfigurations.xonlinex = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        zen-browser.homeModules.default
        ./home/default.nix
      ];
    };
  };
}
