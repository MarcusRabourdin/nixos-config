{ config, pkgs, ... }:

{
  # ============================== Home ============================== #

  home.username = "blue";
  home.homeDirectory = "/home/blue";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = import ./packages/packages.nix pkgs;

  home.sessionPath = [
    "$HOME/scripts"
  ];


  # ============================== imports ================================== #
  
 imports = [
    ./dotfiles/helix.nix # helix
    ./dotfiles/zsh.nix # zsh
  ];
  
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

  # ============================== PipreWire ==============================#

  sound.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enalbe = true;
  }
    
  # ============================== Dotfiles ============================== #

  home.file.".config/i3/config".source = ./dotfiles/i3-config;
}
