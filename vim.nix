with import <nixpkgs> {};

vim_configurable.customize {
  name = "vim";
  vimrcConfig.customRC = ''
    " Set up filetype specific settings filetype plugin on filetype indent on

    " Turn on syntax highlighting
    syntax enable

    " Always have a status bar
    set laststatus=2

    " Reread buffers if the file on disk change
    set autoread
    au FocusGained, BufEnter * checktime

    " Set leader key to space
    let mapleader = " "

    " Fantastic colourscheme
    set background=dark
    colorscheme nord

    " Hide buffers instead of closing them 
    set hidden

    " Exit insert mode with jk or kj
    inoremap jk <esc>
    inoremap kj <esc>

    " On POSIX-compatible terminals
    " Change cursor look depending on mode 
    " Insert mode = line cursor
    " Normal mode = block cursor
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"

    " Configure backspace properly
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " Highlight search results incrementally
    set hlsearch
    set incsearch

    " Show matching brackets when cursor is over them
    set showmatch

    " No annoying error bells
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    " Small margin on the left
    set foldcolumn=1

    " No backups or swapfiles
    set nobackup
    set nowb
    set noswapfile

    " Always use spaces instead of tabs
    set expandtab

    " Be smart about tabs
    set smarttab

    " 1 tab = 4 spaces, as it should be
    set shiftwidth=4
    set tabstop=4

    " Automatic smart indentation
    set autoindent
    set smartindent

    " Wrap on word boundaries
    set wrap
    set linebreak

    " Personal statusline config (nice and simple)
    set statusline=
    set statusline+=%#StatusLine#
    set statusline+=\ %f
    set statusline+=%m 
    set statusline+=%#StatusLineNC#
    set statusline+=%=
    set statusline+=\ %y
    set statusline+=\ %p%%
    set statusline+=\ %l:%c
    set statusline+=\    

    set shortmess+=I

    " Hybrid line numbers
    set number relativenumber

    " Use tab for trigger completion with characters ahead and navigate.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <cr> to confirm completion
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:pear_tree_repeatable_expand=0

    nnoremap j gj
    nnoremap k gk

    set tags+=~/code/rs/elgin/rusty-tags.vi

    nnoremap <Leader>f :Files<cr>
    nnoremap <Leader>l :Lines<cr>
    nnoremap <Leader>c :Commits<cr>
    nnoremap <Leader>t :Tags<cr>

    packadd termdebug

    set rtp+=/home/jch/.opam/default/share/merlin/vim

    function! OpenCompletion()
        if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
            call feedkeys("\<C-x>\<C-o>", "n")
        endif
    endfunction

    autocmd InsertCharPre *.ml,*.mli,*.mly,*.mll call OpenCompletion()

    set completeopt+=menuone,noselect,noinsert
  '';
  vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
    start = [ nord-vim coc-nvim pear-tree vim-polyglot fzf-vim fugitive ];
    opt = [];
  };
}
