{ config, pkgs, ... }:

{
    environment.systemPackages = [
        pkgs.minecraft
    ];
}
