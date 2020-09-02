{ config, lib, pkgs, ...}:

with lib;

{
  options.settings = {
    username = mkOption {
      default = "bear5";
      type = types.str;
      description = "The main user name with uid = 1000";
    };
  };
}	
