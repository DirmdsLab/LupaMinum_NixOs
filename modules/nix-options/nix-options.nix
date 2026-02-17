{ config, lib, pkgs, ... }:

{

  # Terminal
  programs.fish.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  # Files
  programs.xfconf.enable = true;
  programs.thunar.enable = true;

  # Tablet
  hardware.opentabletdriver.enable = true;

  # Miror
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  # disk
  services.udisks2.enable = true;

  # Podman
  virtualisation.podman.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";

}
