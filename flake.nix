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
    system = "x86_64-linux";              
    pkgs = nixpkgs.legacyPackages.${system};

    # mkHost is a function with 'hostname' as argument
    mkHost = hostname: nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./hosts/${hostname}/configuration.nix
        home-manager.nixosModules.home-manager

        # Other module 
        {
          home.manager = {
            useGlobalPkgs = true;
            useUserPackahes = true;
            users.blue = import ./home.nix;
          };
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

