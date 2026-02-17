{
  description = "Nix LupaMinum";

  inputs = {

    # Nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Quickshell
    quickshell = {

      url = "github:quickshell-mirror/quickshell";

      inputs.nixpkgs.follows = "nixpkgs";

    };

  };

  outputs = { self, nixpkgs, lanzaboote, quickshell, ... }: {

    nixosConfigurations.Tutturuu = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [

        # Configuration
        ./configuration.nix

        # lanzaboote module
        lanzaboote.nixosModules.lanzaboote

        # config secure boot
        ({ pkgs, lib, ... }: {
          environment.systemPackages = [
            pkgs.sbctl
          ];

          # matikan systemd-boot bawaan
          boot.loader.systemd-boot.enable = lib.mkForce false;

          boot.lanzaboote = {
            enable = true;
            pkiBundle = "/var/lib/sbctl";
          };
        })

        # quickshell
        { _module.args.quickshell = quickshell; }
        ./modules-flake/apps/quickshell.nix

      ];
    };
  };
}
