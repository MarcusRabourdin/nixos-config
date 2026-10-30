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
      pull.rebase = true;

      alias = {
        s = "status";
      };
    };
  };
}
