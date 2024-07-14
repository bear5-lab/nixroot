{ config, lib, pkgs, ... }:

let home-manager = builtins.fetchGit {
      url= "https://github.com/rycee/home-manager";
      ref = "release-24.05";
   };
in
with pkgs.lib;
{
  imports = [ 
    "${home-manager}/nixos"
    ../options/default.nix
  ];  
  
  home-manager.users."${config.bix.mainUser}" = {
    home.packages = with pkgs; [
      alacritty
    ];
    home.stateVersion = "24.05";

    xdg.configFile."alacritty/alacritty.toml".source = ./alacritty.toml;
  };
}
