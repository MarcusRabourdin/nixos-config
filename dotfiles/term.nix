{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.hack-font
  ];

  fonts.fontconfig.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      colors.primary = {
        background = "#000000";
        foreground = "#ffffff";
        dim_foreground = "#828482";
      };

      window = {
        title = "Blue terminal";
        dynamic_title = true;
        opacity = 0.5;
      };

      font = {
        normal = {
          family = "Hack";
          style = "Regular";
        };
        size = 11.25;
      };
    };
  };
}
