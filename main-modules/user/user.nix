{ config, lib, pkgs, ... }:

{

  # User account
  users.users.tutturuu = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; 

    packages = with pkgs; [

      # File
      yazi
      fzf

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

      # Image
      loupe

      # Tool mpvpaper
      socat
      jq

      # UwU
      cava
      peaclock

      # Dev
      vscodium
      
      # Terminal
      foot
      starship

      # Themes
      nwg-look

      # Translate
      translate-shell

      # Tool
      obs-studio

      # Osu
      icu76

      # Pass
      age

      # Discord
      discord      

    ];
    
    # Default user terminal
    shell = pkgs.fish;

  };

}
