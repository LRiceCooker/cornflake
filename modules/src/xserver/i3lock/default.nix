{ services, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    i3lock
  ];
  
  services.screen-locker.lockCmd = "${pkgs.i3lock}/bin/i3lock -n -c 000000";
}
