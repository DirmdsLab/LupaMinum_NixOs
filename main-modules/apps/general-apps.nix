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
      mangohud

      # Archive
      p7zip
      file-roller

      # Disk
      gparted
      ncdu
  
      # System Monitor
      btop
      radeontop
      nvtopPackages.amd
  
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
      kdePackages.qtdeclarative
  
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
