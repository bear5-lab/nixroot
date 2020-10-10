
{ config, lib, pkgs, ... }:

{
  services.logind = {
    # config for lid close action
    # 1. if laptop is docked or powered, ignore the lid close
    # 2. otherwise it will suspend and hibernate, leaves 60s
    #    for dock or plugin the power
    lidSwitch = "suspend-then-hibernate";
    lidSwitchDocked = "ignore";
    lidSwitchExternalPower = "ignore";
    extraConfig = "
      HoldoffTimeoutSec=60;
    ";
  };
}
