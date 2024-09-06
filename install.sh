#!/bin/bash

# Variables
GITHUB_REPO_URL="https://github.com/LRiceCooker/cornflake/archive/refs/heads/main.zip"
TARGET_DIR="/mnt"
HARDWARE_CONFIG="/mnt/etc/nixos/hardware-configuration.nix"
FOLDER_NAME="cornflake-main"
FLAKE_PATH="$TARGET_DIR/$FOLDER_NAME"

function delete_folder() {
    echo "delete folder..."
    sudo rm -rfd /mnt/*
    sudo rm /tmp/nixos-config.zip
}

function pull_github_repo() {
    echo "Pulling $GITHUB_REPO_URL..."
    curl -L $GITHUB_REPO_URL -o /tmp/nixos-config.zip
    
    echo "Extracting $GITHUB_REPO_URL..."
    unzip /tmp/nixos-config.zip -d /mnt
}

function generate_hardware_config() {
    if [ ! -f "$HARDWARE_CONFIG" ]; then
        echo "generate hardware-configuration.nix..."
        nixos-generate-config --root /mnt
    fi
}

function replace_hardware_config() {
    echo "replace hardware-configuration.nix..."
    rm $FLAKE_PATH/nixos/hardware-configuration.nix
    cp $HARDWARE_CONFIG $FLAKE_PATH/nixos/hardware-configuration.nix
}

function apply_flake() {
    echo "apply flake..."
    sudo nixos-install --flake $FLAKE_PATH#cornflake
    sudo nixos-rebuild switch --flake $FLAKE_PATH#cornflake
}

function cleanup_old_generations() {
    echo "cleanup old generations..."
    sudo nix-collect-garbage --delete-older-than 30d
    sudo nix-env --delete-generations +8
}

function debug(){
    nix --extra-experimental-features 'nix-command flakes' flake check $FLAKE_PATH
}

delete_folder
pull_github_repo
generate_hardware_config
replace_hardware_config
debug
# apply_flake
# cleanup_old_generations

echo "Done!"
