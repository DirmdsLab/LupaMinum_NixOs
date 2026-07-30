{ config, lib, pkgs, ... }:

{
  # Imports
  imports =
    [ 

      # Hardware
      ./hardware-configuration.nix

      # systemd-boot
      ./main-modules/systemd-boot/systemd-boot.nix

      # Sound
      ./main-modules/sound/sound.nix

      # User
      ./main-modules/user/user.nix

      # nix-options
      ./main-modules/nix-options/nix-options.nix
      ./main-modules/nix-options/lock.nix
     
      # System Apps
      ./main-modules/apps/general-apps.nix

      # Login
      ./main-modules/ssdm/ssdm.nix

      # VM
      ./main-modules/virt-manager/vm.nix

      # Fonts
      ./main-modules/fonts/fonts.nix

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
  system.stateVersion = "25.11"; 

}

