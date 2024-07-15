{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    difftastic
    gitg 
    tig
  ];

  programs.git = {
    enable = true;
  };
}
