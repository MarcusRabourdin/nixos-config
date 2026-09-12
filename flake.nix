{
  description = "Configuration NixOs de blue";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";              # ← à ajouter
    pkgs = nixpkgs.legacyPackages.${system};  # ← à ajouter
    mkHost = hostname: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/${hostname}/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.blue = import ./home.nix;
        }
      ];
    };
  in {
    nixosConfigurations = {
       main-nixos = mkHost "main-nixos";
     };

    packages.${system}.tools = pkgs.buildEnv {
      name = "blue-tools";
      paths = import ./packages/packages.nix pkgs;
    };
  };
}

