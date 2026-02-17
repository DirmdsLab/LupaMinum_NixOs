{ config, lib, pkgs, ... }:

{

  # Lock
  security.pam.services.hyprlock = {
    text = ''
      #%PAM-1.0
      auth       include      login
      account    include      login
    '';
  };

}
