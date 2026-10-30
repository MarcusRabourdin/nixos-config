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

  home.sessionPath = map(dir: "${configurationPath}/bin/${dir}") [
    "pk"
    "hdmi"
    "bluetooth"
  ];

  # ~/config -> /etc/nixos
  home.file."config".source = config.lib.file.mkOutOfStoreSymlink configurationPath;

  imports = [
    ./dotfiles/helix.nix # helix
    ./dotfiles/zsh.nix # zsh
    ./dotfiles/i3.nix # i3
    ./dotfiles/term.nix # terminal
    ./dotfiles/git.nix # git
  ];

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  # home.file.".config/i3/config".source = ./dotfiles/i3-config;
}
