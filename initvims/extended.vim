
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => init.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>ss :source $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" depends on color plugin
"colorscheme melange
colorscheme dracula

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => change encoding to
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>eu :e ++enc=utf-8<CR>
map <leader>ec :e ++enc=cp932<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UnitTest
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open terminal in right vsplit window
":vsplit | wincmd l | vertical resize 80 | terminal
command! OpenTestWindow :vsplit | wincmd l | vertical resize 80 | terminal
noremap <leader>tw :OpenTestWindow<CR>
" execute prev command in right vsplit window
":wincmd l | i | <Up><CR> | <Esc> | wincmd h
command! ExecutePrevCommand :wincmd l | call feedkeys("i\<Up>\<CR>\<Esc>\<C-h>")
noremap <leader>tt :ExecutePrevCommand<CR>

