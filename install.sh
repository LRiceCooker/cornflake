#!/bin/bash

# Variables
GITHUB_REPO_URL="https://github.com/ton-user/ton-repo/archive/refs/heads/main.zip"
TARGET_DIR="/mnt/nixos-config"
HARDWARE_CONFIG="/etc/nixos/hardware-configuration.nix"
FOLDER_NAME="ton-repo-main"
FLAKE_PATH="$TARGET_DIR/$FOLDER_NAME"

function pull_github_repo() {
    echo "Téléchargement du dépôt GitHub..."
    curl -L $GITHUB_REPO_URL -o /tmp/nixos-config.zip
    
    echo "Décompression du dépôt..."
    unzip /tmp/nixos-config.zip -d /mnt
}

function generate_hardware_config() {
    if [ ! -f "$HARDWARE_CONFIG" ]; then
        echo "Génération de la configuration matérielle..."
        nixos-generate-config --root /mnt
    fi
}

function replace_hardware_config() {
    echo "Remplacement du fichier hardware-configuration.nix..."
    cp $HARDWARE_CONFIG $FLAKE_PATH/nixos/hardware-configuration.nix
}

function apply_flake() {
    echo "Application du flake..."
    sudo nixos-rebuild switch --flake $FLAKE_PATH#$(cornflake)
}

function cleanup_old_generations() {
    echo "Nettoyage des anciennes générations, conservation des 8 dernières..."
    sudo nix-collect-garbage --delete-older-than 30d
    sudo nix-env --delete-generations +8
}


pull_github_repo
generate_hardware_config
replace_hardware_config
apply_flake
cleanup_old_generations

echo "Installation terminée !"
