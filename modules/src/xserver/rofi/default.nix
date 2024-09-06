{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi
  ];

  programs.rofi = {
    enable = true;
    cycle = true;
    location = "center";
    plugins = [
    pkgs.rofi-calc
    pkgs.rofi-emoji
    pkgs.rofi-systemd
    ];
  };
}
