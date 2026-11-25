{
  config,
  pkgs,
  ...
}: let
  configurationPath = "/etc/nixos";
in {
  # ============================== Home ============================== #

  programs = {
    home-manager.enable = true;

    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home = {
    username = "blue";
    homeDirectory = "/home/blue";
    stateVersion = "25.11";
    packages = (import ./packages/core.nix pkgs) ++ (import ./packages/currently_usefull.nix pkgs);
    sessionVariables = {
      CONFIGURATION_PATH = configurationPath;
    };

    sessionPath = map (dir: "${configurationPath}/bin/${dir}") [
      "pk"
      "hdmi"
      "bluetooth"
    ];

    # ~/config -> /etc/nixos
    file."config".source = config.lib.file.mkOutOfStoreSymlink configurationPath;
  };

  imports = [
    ./dotfiles/helix.nix # helix
    ./dotfiles/zsh.nix # zsh
    ./dotfiles/i3.nix # i3
    ./dotfiles/term.nix # terminal
    ./dotfiles/git.nix # git
  ];
}
