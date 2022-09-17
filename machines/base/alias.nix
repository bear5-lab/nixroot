
{ config, lib, pkgs, ... }:

{
  environment.shellAliases = {
    g = "cd ~/projects";
    root = "cd ~/projects/nixroot";
    robo = "cd ~/projects/robotics";
    cdd = "cd $(fd --type directory . $HOME | fzf -e)";
  };
  
  environment.interactiveShellInit=
  ''
      function format() {
              clang-format -i --style=file "$@"
      }
  '';

}
