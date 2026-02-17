{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  
      # Tools
      wget
      git
      neofetch
      ydotool
      usbutils  
      sshfs
      tmux
      efibootmgr
      zip
      unzip


      # Disk
      gnome-disk-utility
      ncdu
  
      # System Monitor
      btop
      radeontop
  
      # Audio
      pulseaudio
      pavucontrol
  
      # Hyprland Tools
      kitty
      hyprlock
      wofi
      hypridle
  
      # Better Tools
      eza
      bat
  
      # Sudo
      hyprpolkitagent
  
      # Clipboard
      wl-clipboard
      cliphist
  
      # Notification
      mako
      libnotify    
  
      # App-Image
      appimage-run
      icu
  
    ];

}
