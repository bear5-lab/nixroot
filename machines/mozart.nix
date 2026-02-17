{ config, pkgs, ... }:

let 
 bix = config.bix;

in 
{
  bix = {
    mainUser = "bear5";
    machineType = "laptop";
  };


  imports = [
    ./base/default.nix
    ../modules/desktop
    ../modules/dev/python.nix
    ../modules/dev/vscode.nix
    ./base/alias.nix
  ]; 

  home-manager.users."${bix.mainUser}" = {
    programs.git.settings.user = {
      name = "bear5";
      email = "john.xiongwu@gmail.com";
    };
  };

  time.timeZone = "Asia/Shanghai";

  services.mullvad-vpn.enable = true;

  services.libinput = {
    touchpad.naturalScrolling = false;
    mouse.leftHanded = true;
  };

  networking = {
    # Machine-specific networking configuration.
    hostName = "mozart";
    # Generated via `head -c 8 /etc/machine-id`
    hostId = "a9354080";

    networkmanager.enable = true;
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour
    useDHCP = false;
    interfaces.wlp2s0.useDHCP = true;

  };
}
