
{ config, lib, pkgs, ... }:

{
  environment.shellAliases = {
    g = "cd ~/projects";
    root = "cd ~/projects/nixroot";
    cdd = "cd $(fd --type directory . $HOME | fzf -e)";
  };

}
