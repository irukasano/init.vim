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
"Plug 'Shougo/deoplete.nvim'
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'Shougo/neco-vim'
" TODO phpactor は php7.3 以上が必要なので、phpcd がよい？
"Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
"Plug 'kristijanhusak/deoplete-phpactor'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" file tree
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-bookmark.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

" status line
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

" colorscheme
Plug 'w0ng/vim-hybrid'


call plug#end()

