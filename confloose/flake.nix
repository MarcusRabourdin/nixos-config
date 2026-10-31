{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";
  };

  outputs = inputs: {
    packages = builtins.mapAttrs (system: pkgs: {
      mon-script = pkgs.writeShellApplication {
        name = "mon-script";
        text = builtins.readFile ./mon-script.sh;
      };
      
      default = inputs.self.packages.${system}.mon-script;
    }) inputs.nixpkgs.legacyPackages;
  };
}
