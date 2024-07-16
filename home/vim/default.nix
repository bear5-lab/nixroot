{config, lib, pkgs, ...}:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    # Plugin list can be found in 
    # https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/applications/editors/vim/plugins/generated.nix
    plugins = with pkgs.vimPlugins; [
      auto-pairs 
      fzf-vim 
      gruvbox # vim colorscheme showcase https://vimcolorschemes.com/i/top/b.dark/e.vim
      vim-cpp-enhanced-highlight
      ctrlp-vim
    ];
    extraConfig = ''
        syntax enable
        colorscheme gruvbox
        set background=dark
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
