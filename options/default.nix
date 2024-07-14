{ config, lib, pkgs, ...}:

with lib;

{
  options.bix= {
    mainUser = mkOption {
      default = "bear5";
      type = types.str;
      description = "The main user name with uid = 1000";
    };
  };

  options.bix = {
    machineType = mkOption {
      type = types.enum ["workstation" "laptop"];
      default = "workstation";
      description = ''
        Specify the machine type, [workstation, laptop]
      '';
    };
  };

  config.users.users."${config.bix.mainUser}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"   # enable "sudo for the user
      "networkmanager"  # enable change network settings
    ];
  };

  config.services.logind = if (config.bix.machineType == "laptop") then
  {
    lidSwitch = "suspend-then-hibernate";
    lidSwitchDocked = "ignore";
    lidSwitchExternalPower = "ignore";
    extraConfig = ''
      HoldoffTimeoutSec=60;
    '';
  } else {};

}	
