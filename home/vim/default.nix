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
      fzf-vim
      vim-fugitive
    ];
    extraConfig = ''
        syntax enable
        colorscheme gruvbox
        set background=dark
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

        if executable('ag')
          command! -bang -nargs=* Ag
                \ call fzf#vim#grep(
                \   'ag --nocolor --nogroup --column -- '.shellescape(<q-args>), 1,
                \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}) : fzf#vim#with_preview(),
                \   <bang>0)
        endif

        command! CFormat execute 'let pos = getpos(".")' | execute '%!clang-format -style=file' | execute 'call setpos(".", pos)'
        
        let mapleader = "/"

        nnoremap <leader>f :Ag<SPACE>
        nnoremap <Leader>c :CFormat<CR>

        xnoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>

    '';
  };
}
