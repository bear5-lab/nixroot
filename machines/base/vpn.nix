
{ config, lib, pkgs, ... }:

let 
  name = "tzz5dm8aiefr37w6uutrxy8h";
  pswd = "fbwfsaoj3fc5hg7x4xrlyvdm";
in {
  services.openvpn.servers = {
    la = {
      config = "config /home/bear5/.config/nixos/usa_la.ovpn";
      authUserPass = {
        username = name; 
        password = pswd;
      };
      autoStart = false;
      updateResolvConf = true;
    };
  };
}
