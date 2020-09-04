{ config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [

    (
     with import <nixpkgs> {};

     vim_configurable.customize {
     name = "vim";
     vimrcConfig.customRC = ''
        syntax enable
        set number relativenumber
        set incsearch
        set noswapfile
     '';
     }
    )
  ];
}


