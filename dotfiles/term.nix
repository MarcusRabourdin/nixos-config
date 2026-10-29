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
        }; 
          
      };
    };
  }
