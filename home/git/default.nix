{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    difftastic
    gitg 
  ];

  programs.git = {
    enable = true;
  };
}
