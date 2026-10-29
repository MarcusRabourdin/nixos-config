{
  config,
  pkgs,
  ...
}: let
  configurationPath = "/etc/nixos";
in {
  # ============================== Home ============================== #

  home = {
    username = "blue";
    homeDirectory = "/home/blue";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  home.packages =
    (import ./packages/core.nix pkgs)
    ++ (import ./packages/currently_usefull.nix pkgs);

  home.sessionVariables = {
    CONFIGURATION_PATH = configurationPath;
  };

  home.sessionPath = [
    "${configurationPath}/bin"
    "${configurationPath}/bin/pk"
    "${configurationPath}/bin/hdmi"
    "${configurationPath}/bin/bluetooth"
    "${configurationPath}/bin/utils"
  ];

  # ============================== imports ================================== #

  imports = [
    ./dotfiles/helix.nix # helix
    ./dotfiles/zsh.nix # zsh
    ./dotfiles/i3.nix # i3
    ./dotfiles/git.nix # git
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

  # ============================== Dotfiles ============================== #

  # home.file.".config/i3/config".source = ./dotfiles/i3-config;
}
