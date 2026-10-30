{
  config,
  pkgs,
  ...
}: {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "alacritty";
      modifier = "Mod4";
      # Check doc for more
    };
  };
}
