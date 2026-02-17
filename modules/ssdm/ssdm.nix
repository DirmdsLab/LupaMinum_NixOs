{ config, lib, pkgs, ... }:

# Mods
let
  customTheme = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
    themeConfig = {
      Background = "/etc/nixos/modules/ssdm/pixelpc.mp4";
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
