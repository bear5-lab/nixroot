
{ config, lib, pkgs, ... }:
let 
  myCustomLayout = pkgs.writeText "xkb-layout" ''
      keycode 64 = Mode_switch
      keysym h = h H Left Left
      keysym l = l L Right Right
      keysym k = k K Up Up
      keysym j = j J Down Down
    '';
in {
  services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ${myCustomLayout}";
}
