{
  config,
  pkgs,
  ...
}: {
  
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      # Check doc for more
    };
  };

}
