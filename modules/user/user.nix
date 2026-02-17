{ config, lib, pkgs, ... }:

{

  # User account
  users.users.tutturuu = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; 

    packages = with pkgs; [

      # File
      file-roller

      # Android-Tools
      android-tools
      scrcpy

      # Wallpaper
      mpvpaper

      # ss
      grim
      slurp

      # Player
      mpv
      ffmpeg-full

      # Tool mpvpaper
      socat
      jq

      # UwU
      cava
      tty-clock

      # Dev
      vscodium
   
      # Terminal
      foot
      starship

      # Themes
      nwg-look

      # Translate
      translate-shell

    ];
    
    # Default user terminal
    shell = pkgs.fish;

  };

}
