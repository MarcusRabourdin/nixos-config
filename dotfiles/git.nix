{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        email = "marcus.rabourdin@epita.fr";
        name = "marcus";
      };

      init.defaultBranch = "master";
      safe.directory = "/etc/nixos";
      pull.rebase = true;

      alias = {
        s = "status";
      };
    };
  };
}
