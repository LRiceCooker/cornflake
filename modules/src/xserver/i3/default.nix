{ services, config, pkgs, ... }:

{
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps; # Utilisation de la version "gaps" d'i3 si tu la préfères
    extraConfig = builtins.readFile ./i3.config; # Chemin relatif vers i3-config
    config = {
      terminal = "alacritty"
    }
  };
}
