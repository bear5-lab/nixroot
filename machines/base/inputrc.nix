
{ config, lib, pkgs, ... }:

{
  environment.etc = {
    "inputrc".text = lib.mkDefault (
      builtins.readFile <nixpkgs/nixos/modules/programs/bash/inputrc> + ''
        ## arrow up 
        "\e[A":history-search-backward
        ## arrow down
        "\e[B":history-search-forward
        ''
      );
  };
}
