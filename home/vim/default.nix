{config, lib, pkgs, ...}:

{
  # all vim options can be found in
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/vim.nix
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [auto-pairs fzf-vim];
    extraConfig = ''
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


        :map <C-S-n> :Files<CR>

    '';
  };
}
