{
  config,
  pkgs,
  ...
}:
  {
    programs.git = {
      enable = true;
      userEmail = "marcus.rabourdin@epita.fr";
      userName = "marcus";
      #initDefaultBranch = "master";
      #safeDirectory = "/etc/nixos";
    };
}
