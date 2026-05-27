{ config, pkgs, ... }:

let 
 bix = config.bix;

in 
{
  bix = {
    mainUser = "bear5";
    machineType = "laptop";
    gitUser = {
      name = "bear5";
      email = "john.xiongwu@gmail.com";
    };
  };


  imports = [
    ./base/default.nix
  ]; 

  networking = {
    # Machine-specific networking configuration.
    hostName = "mozart";
    # Generated via `head -c 8 /etc/machine-id`
    hostId = "a9354080";

  };
}
