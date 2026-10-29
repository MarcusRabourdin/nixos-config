{
  config,
  pkgs,
  ...
}:
  {
    programs.alacritty = {
      enable = true;
      settings = {
        colors.primary = {
          background = "#000000";
          foreground = "#ffffff";
        };
      };
    };
  }
