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
  
  outputs = {nixpkgs, ...} @ inputs: let
    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/${hostname}/configuration.nix
          inputs.home-manager.nixosModules.home-manager
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

    packages = inputs.confloose.packages;
    formatter = builtins.mapAttrs(system: pkgs: pkgs.alejandra) nixpkgs.legacyPackages;
  };
}
