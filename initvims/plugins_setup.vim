let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf'

" file tree
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-bookmark.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

" status line
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" git
Plug 'tpope/vim-fugitive'

" white spaces
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'

" colorscheme
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'w0ng/vim-hybrid'
Plug 'jacoborus/tender.vim'
Plug 'elvessousa/sobrio'
"Plug 'Shatur/neovim-ayu'
Plug 'savq/melange'
Plug 'dracula/vim', {'as': 'dracula'}

call plug#end()

