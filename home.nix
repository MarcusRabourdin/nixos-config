{ config, pkgs, ... }:

{
  # ============================== Home ============================== #

  home.username = "blue";
  home.homeDirectory = "/home/blue";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    gcc
    pciutils
    cmake
    openssl
    pkg-config
    ninja
    git
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    tree
    pavucontrol
  ];


  # ============================== imports ================================== #
  
 imports = [
    ./dotfiles/helix.nix # helix
    ./dotfiles/zsh.nix # zsh
  ];

  # ============================== Shell (zsh) ============================== #
  
  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  # ============================== Terminal (alacritty) ============================== #

  programs.alacritty = {
    enable = true;
    settings = {
      colors.primary = {
        background = "#000000";
        foreground = "#ffffff";
      };
    };
  };

    
  # ============================== Dotfiles ============================== #

  home.file.".config/i3/config".source = ./dotfiles/i3-config;
}
