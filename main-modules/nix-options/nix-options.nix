{ config, lib, pkgs, ... }:

{

  # Firefox
  programs.firefox.enable = true;

  # Terminal
  programs.fish.enable = true;

  # polkit
  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Files
  programs.xfconf.enable = true;
  programs.thunar.enable = true;

  # Tablet
  hardware.opentabletdriver.enable = true;

  # Game
  programs.gamemode.enable = true;
  programs.appimage.enable = true;


  # Miror
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  # Podman
  virtualisation.podman.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";

}
