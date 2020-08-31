{ config, lib, pkgs, ... }:

let home-manager = builtins.fetchGit {
      url= "https://github.com/rycee/home-manager";
      ref = "release-20.03";
   };
in
with pkgs.lib;
{
  imports = [ 
    "${home-manager}/nixos"
  ];  
  
  home-manager.users.bear5 = {
    home.packages = with pkgs; [
      alacritty
    ];
  
    xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
  };
}
