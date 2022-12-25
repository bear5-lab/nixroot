
{ config, lib, pkgs, ... }:

{
  environment.shellAliases = {
    g = "cd ~/projects";
    root = "cd ~/projects/nixroot";
    robo = "cd ~/projects/robotics";
    cdd = "cd $(fd --type directory . $HOME | fzf -e)";
    gs = "git status";
  };
  
  environment.interactiveShellInit=
  ''
      function format() {
              clang-format -i --style=file "$@"
      }
      
      function format_py(){
          yapf -i --style=google "$@"
      } 

      export PYTHONPATH=$PYTHONPATH:~/projects/mamba
  '';

}
