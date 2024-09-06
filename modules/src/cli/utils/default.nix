{pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    docker
    tig
    winePackages.base
  ];
}
