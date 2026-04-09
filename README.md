# Personal OS - NixOS

## Struktur Project

```bash
.
├── modules/
│   ├── apps/                # General Apps
│   ├── nix-options/         # Options
│   ├── sound/               # Audio configuration
│   ├── ssdm/                # Ssdm
│   ├── systemd-boot/        # Bootloader config
│   ├── user/                # User 
│   └── virt-manager/        # Virtualization setup
│
├── modules-flake/
│   └── apps/                # Module flake
│
├── configuration.nix        # Main Config
├── flake.nix                # Flake definition
├── flake.lock               # Lock dependency
└── hardware-configuration.nix  # Auto-generated (ignore)
```
                
## additional explanation

###  `modules/ssdm/`

Konfigurasi SDDM 

- Theme: [sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme)
- Custom asset: video wallpaper `hyprland_kath.mp4`

###  `modules/virt-manager/`

Virtualization setup based on `virt-manager`, with GPU passthrough support.

- GPUs: Integrated GPU (iGPU) + RX 580
- Passthrough can be toggled on or off from `configuration.nix`

###  `modules-flake/`

Flake-based modules using the unstable channel.

External repositories used:
- Secure Boot: [lanzaboote](https://github.com/nix-community/lanzaboote)
- quickshell: [quickshell](https://github.com/quickshell-mirror/quickshell)

###  `hardware-configuration.nix`

- `hardware-configuration.nix` is auto-generated using:
  ```bash
  nixos-generate-config --root /mnt



## How Install

### Download ISO

Use the minimal version:  

ISO: [latest-nixos-minimal-x86_64-linux.iso](https://nixos.org/download/)

## Boot via USB

- Create a bootable USB (e.g., using **[Ventoy](https://github.com/ventoy/Ventoy)**).  
- Boot from the USB into the NixOS minimal live environment.  

## Initial Setup

1. **Internet Connection** (make sure you can `ping google.com`)  
2. **Disk Setup** with **GPT scheme**:  
    - `boot` → **EFI**   
    - `/root` → **LUKS (encrypted)**  

    References:
    - [NixOS Installation Manual](https://nixos.org/manual/nixos/stable/#sec-installation-manual)
    - [LUKS Setup](https://nixos.org/manual/nixos/stable/#ch-file-systems)
      
    ## First Configuration

    Use the initial configuration file generated earlier, then edit it manually:

    - configuration-live.nix
    - flake.nix

    Move the file:
    - temp/configuration-live.nix → /etc/nixos/configuration.nix

    ## Install & Reboot

    - Run the installation process following the manual.  
    - Reboot into your new NixOS system with encryption enabled.  

    ## After Install
    After reboot, run `setup-update-nix.sh` and choose option 2 (update).

    Option 1 is for setting up Secure Boot and enrolling keys.

    For more information about Secure Boot:
    - [Lanzaboote (Secure Boot for NixOS)](https://github.com/nix-community/lanzaboote)

    Good luck :v