{
  description = "Configuration NixOs de blue";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    confloose = {
      url = "path:./confloose";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    confloose,
    ...
  }: let
    # mkHost is a function with 'hostname' as argument
    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/${hostname}/configuration.nix
          home-manager.nixosModules.home-manager

          # Other module
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.blue = import ./home.nix;
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      main-nixos = mkHost "main-nixos";
    };

    packages = confloose.packages;

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    
  };
}
