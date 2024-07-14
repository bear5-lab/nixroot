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

  config.users.users."${config.bix.mainUser}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"   # enable "sudo for the user
      "networkmanager"  # enable change network settings
    ];
  };

}	
