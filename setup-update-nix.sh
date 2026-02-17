#!/usr/bin/env bash
set -e

TARGET_DIR="/etc/nixos"
SAFE_FILES=("hardware-configuration.nix" "flake.lock")

clean_nixos_folder() {
    echo "Clean $TARGET_DIR except ${SAFE_FILES[*]}..."

    for item in "$TARGET_DIR"/*; do
        
        skip=false
        for safe_file in "${SAFE_FILES[@]}"; do
            if [ "$item" = "$TARGET_DIR/$safe_file" ]; then
                echo "Skip: $item"
                skip=true
                break
            fi
        done
        $skip && continue

        echo "Delete: $item"
        sudo rm -rf "$item"
    done

    SCRIPT_DIR="$(pwd)"

    if [ ! -f "$TARGET_DIR/hardware-configuration.nix" ]; then
        echo "ERROR: hardware-configuration.nix not found in $TARGET_DIR"
        exit 1
    fi
    cp "$TARGET_DIR/hardware-configuration.nix" "$SCRIPT_DIR/"
    echo "Copied hardware-configuration.nix to $SCRIPT_DIR/"

    if [ -f "$TARGET_DIR/flake.lock" ]; then
        cp "$TARGET_DIR/flake.lock" "$SCRIPT_DIR/"
        echo "Copied flake.lock to $SCRIPT_DIR/"
    else
        echo "WARNING: flake.lock not found (optional), continue"
    fi

}

clean_and_update() {
    echo "[2] CLEAN & UPDATE"

    clean_nixos_folder

    # Copy config
    sudo cp configuration.nix $TARGET_DIR/
    sudo cp flake.nix $TARGET_DIR/
    sudo cp flake.lock $TARGET_DIR/

    sudo cp -r modules $TARGET_DIR/
    sudo cp -r modules-flake $TARGET_DIR/

    echo "Next Step"
    echo "sudo nixos-rebuild switch --flake /etc/nixos#Tutturuu"
    echo "Done..."

}

setup() {
    echo "Place your Secure Boot keys in '/var/lib/sbctl' if you already have them."
    echo "If not, you can create new keys using:"
    echo "  nix-shell -p sbctl --run \"sudo sbctl create-keys\""
    echo "Make sure the system is in Secure Boot *setup mode* when creating new keys."
    echo

    read -rp "Continue? [y/N]: " answer

    case "$answer" in
        y|Y)
            echo "Continuing setup..."
            clean_and_update

            echo
            echo "Verifying Secure Boot status:"
            sudo sbctl verify

            echo
            echo "Bootloader status:"
            sudo bootctl status

            echo
            echo "If this is your first setup, run the following command while in setup mode:"
            echo "  sudo sbctl enroll-keys --microsoft"
            ;;
        *)
            echo "Setup cancelled. Exiting."
            exit 1
            ;;
    esac
}

exit_program() {
    echo "Exit..."
    exit 0
}

# ======================================================
#                       MENU
# ======================================================

echo "==========================="
echo "         MAIN MENU"
echo "==========================="
echo "1) Setup"
echo "2) Update"
echo "0) Exit"
echo "==========================="
read -rp "Opsi: " choice

case "$choice" in
    1) setup ;;
    2) clean_and_update ;;
    0) exit_program ;;
    *) echo "Bro..."; exit 1 ;;
esac
