{ config, lib, pkgs, ... }:

{
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "tutturuu" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  # --- VFIO GPU passthrough ---
  boot.kernelModules = [ "vfio_pci" "vfio_iommu_type1" "vfio" "vendor_reset" ];

  boot.extraModprobeConfig = ''
    options vfio-pci ids=1002:6fdf,1002:aaf0
  '';
  
}

