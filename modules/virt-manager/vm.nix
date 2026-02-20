{ config, lib, pkgs, ... }:

{
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "tutturuu" ];

  virtualisation.libvirtd = {
    enable = true;

    qemu = {

      swtpm.enable = true;     
    
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  # --- IOMMU ---
  boot.kernelParams = [
    "amd_iommu=on"
    "iommu=pt"
    "vfio-pci.ids=1002:6fdf,1002:aaf0"
  ];

  boot.kernelModules = [
    "vfio_pci"
    "vfio_iommu_type1"
    "vfio"
    "vendor_reset"
  ];
}