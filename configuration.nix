{ config, lib, pkgs, ... }:

{
  # Imports
  imports =
    [ 

      # Hardware
      ./hardware-configuration.nix

      # systemd-boot
      ./modules/systemd-boot/systemd-boot.nix

      # Sound
      ./modules/sound/sound.nix

      # User
      ./modules/user/user.nix

      # nix-options
      ./modules/nix-options/nix-options.nix
      ./modules/nix-options/lock.nix
     
      # System Apps
      ./modules/apps/general-apps.nix

      # Login
      ./modules/ssdm/ssdm.nix

    ];

  # Host
  networking.hostName = "Tutturuu";

  # Network
  networking.networkmanager.enable = true; 

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Zram
  zramSwap.enable = true;

  # Text
  i18n.defaultLocale = "en_US.UTF-8";

  # Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Version
  system.stateVersion = "25.05"; 

}

