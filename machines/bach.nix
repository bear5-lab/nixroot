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
    ../modules/dev/vim.nix
    ../modules/dev/python.nix
    ../modules/dev/vscode.nix
    ./base/alias.nix
  ]; 

  home-manager.users."${bix.mainUser}" = {
    programs.git = {
      userName = "bear5";
      userEmail = "john.xiongwu@gmail.com";
    };
  };

  time.timeZone = "Asia/Shanghai";

  services.mullvad-vpn.enable = true;

  services.xserver.libinput = {
    touchpad.naturalScrolling = false;
    mouse.leftHanded = true;
  };

  networking = {
    # Machine-specific networking configuration.
    hostName = "Bach";
    # Generated via `head -c 8 /etc/machine-id`
    hostId = "4b41d8c8";

    networkmanager.enable = true;
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour
    useDHCP = false;
    interfaces.wlp2s0.useDHCP = true;

  };
}
