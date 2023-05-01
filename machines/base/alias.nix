
{ config, lib, pkgs, ... }:

{
  environment.shellAliases = {
    g = "cd ~/projects";
    root = "cd ~/projects/nixroot";
    robo = "cd ~/projects/robotics";
    cdd = "cd $(fd --type directory . $HOME | fzf -e)";
    gs = "git status";
    mount_nas = "sudo mount -t nfs 192.168.31.22:/volume1/homes/wuxiong2 /home/bear5/nas";
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
