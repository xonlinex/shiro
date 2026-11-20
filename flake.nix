{
  description = "Config Nixos + Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
    qylock.url = "github:Darkkal44/qylock";
    sonora.url = "github:sonorahq/sonora";
    umbriel.url = "github:noctalia-dev/umbriel";
    lazyvim.url = "github:pfassina/lazyvim-nix/v16.0.0";
    # nautilus-my-computer.url = "github:yannmasoch/nautilus-my-computer?dir=packaging/nix";
    luciole.url = "github:noctalia-dev/luciole";

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
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      noctalia,
      zen-browser,
      firefox-addons,
      qylock,
      umbriel,
      lazyvim,
      ...
    }@inputs:
    let
      # WARNING: verify user
      username = "xonlinex";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos/configuration.nix
          ./system/default.nix
        ];
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs username; };
        modules = [
          ./home/default.nix
        ];
      };
    };
}
