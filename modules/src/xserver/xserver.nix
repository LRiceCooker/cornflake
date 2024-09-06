{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us"; # QWERTY
    variant = "intl"; # Variante internationale pour les accents
    # xkbOptions = "ctrl:nocaps"; # Option pour désactiver Caps Lock si tu le souhaites
    displayManager.lightdm.enable = true; # Utilisation de lightdm comme display manager
    desktopManager.default = "i3"; # Définir i3 comme gestionnaire de fenêtres
  };
}
