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
    ../options/default.nix
  ];  
  
  home-manager.users."${config.settings.username}" = {
    home.packages = with pkgs; [
      alacritty
    ];
  
    xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
  };
}
