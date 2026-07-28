{ config, lib, pkgs, ... }:

{

  # User account
  users.users.tutturuu = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; 

    packages = with pkgs; [

      # File
      file-roller
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
      tty-clock
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

      # Sosmed
      discord

      # Tool
      moonlight-qt
      obs-studio

      # chromium
      chromium

      # Draw
      krita

      # Osu
      icu76

      # pass
      age      

    ];
    
    # Default user terminal
    shell = pkgs.fish;

  };

}
