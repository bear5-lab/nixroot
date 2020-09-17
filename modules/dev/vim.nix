{ config, pkgs, lib, ...}:

{
  environment.systemPackages = with pkgs; [

    (
     with import <nixpkgs> {};

     vim_configurable.customize {
     name = "vim";
     vimrcConfig.packages.myPkg = with pkgs.vimPlugins; {
      start = [ youcompleteme auto-pairs];
     
     };
     vimrcConfig.customRC = ''
        syntax enable
        set number relativenumber
        set incsearch
        set noswapfile
        set showmatch
        
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set expandtab
        autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
        set autoindent

        set backspace=2
        set wildmenu
        set wildmode=longest:full,full
     '';
     }
    )
  ];
}


