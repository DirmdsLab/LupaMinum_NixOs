{ config, lib, pkgs, ... }:

# Mods
# Change u wallpaper (remove pixelpc)
let
  customTheme = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
    themeConfig = {
      Background = "/etc/nixos/modules/ssdm/hyprland_kath.mp4";
    };
  };

in {

  # Login
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = [ customTheme ];
    theme = "sddm-astronaut-theme";
  };

  # Pkgs
  environment.systemPackages = with pkgs; [

    # Mods
    customTheme

  ];

}
