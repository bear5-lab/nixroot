
{ config, lib, pkgs, ... }:

let 
  name = "kmbc267js5158edvnelygvti";
  pswd = "nok1sgi8a6ukbcsvjkjq6tut";
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
 
    tokyo = {
      config = "config /home/bear5/.config/nixos/tokyo.ovpn";
      authUserPass = {
      username = name;
      password = pswd;      
      };
      autoStart = false;
      updateResolvConf = true;      
    };

  };
}
