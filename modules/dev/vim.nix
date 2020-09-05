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
        
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab
        autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

        set backspace=2
     '';
     }
    )
  ];
}


