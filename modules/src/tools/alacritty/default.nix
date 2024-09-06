{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.alacritty
  ];
  
  programs.alacritty = {
    enable = true;
  };
}
