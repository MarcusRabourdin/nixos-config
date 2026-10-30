{
  description = "Configuration NixOs de blue";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
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

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
