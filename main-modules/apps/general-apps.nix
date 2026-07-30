{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  
      # Tools
      wget
      git
      fastfetch
      ydotool
      usbutils  
      sshfs
      tmux
      efibootmgr
      nvtopPackages.amd
      mangohud

      # Archive
      p7zip

      # Disk
      gparted
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

      # quickshell
      quickshell
      qt6.qtmultimedia
  
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
  
    ];

}
