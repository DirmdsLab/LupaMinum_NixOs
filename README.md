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
- Custom asset: video wallpaper `pixelpc.mp4`

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