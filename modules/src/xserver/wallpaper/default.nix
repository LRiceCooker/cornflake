{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    feh
  ];

  services.xserver.windowManager.i3.extraConfig = ''
    exec --no-startup-id feh --bg-scale ${./wallpaper.jpg}
  '';

}
