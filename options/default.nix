{ config, lib, pkgs, ...}:

with lib;

{
  options.bix = {
    mainUser = mkOption {
      default = "bear5";
      type = types.str;
      description = "The main user name with uid = 1000";
    };
    machineType = mkOption {
      type = types.enum ["workstation" "laptop"];
      default = "workstation";
      description = ''
        Specify the machine type, [workstation, laptop]
      '';
    };
    gitUser = mkOption {
      type = types.submodule {
        options = {
          name = mkOption {
            type = types.str;
            default = "";
            description = "Git user.name for the main user.";
          };
          email = mkOption {
            type = types.str;
            default = "";
            description = "Git user.email for the main user.";
          };
        };
      };
      default = {};
      description = "Git identity for the main user.";
    };
  };

  config.users.users."${config.bix.mainUser}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"   # enable "sudo for the user
      "networkmanager"  # enable change network settings
    ];
  };

  
  #config.services.logind = if (config.bix.machineType == "laptop") then
  #{
  #  lidSwitch = "suspend-then-hibernate";
  #  lidSwitchDocked = "ignore";
  #  lidSwitchExternalPower = "ignore";
  #  extraConfig = ''
  #    HoldoffTimeoutSec=60;
  #  '';
  #} else {};

}	
