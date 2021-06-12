
""""""""""""""""""""""""""""""
" deoplete
""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2


""""""""""""""""""""""""""""""
" fern
""""""""""""""""""""""""""""""
let g:fern#renderer = 'nerdfont'
map <leader>nn :Fern . -reveal=% -drawer -toggle -width=40<CR>

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

