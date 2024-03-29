""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
"au BufNewFile,BufRead *.js set tags+=$HOME/.vim_runtime/data/tags/javascript.tags
" au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color
    endif
endif


""""""""""""""""""""""""""""""
" => Html section
""""""""""""""""""""""""""""""
autocmd Filetype html inoremap <buffer> </ </<C-x><C-o><ESC>F<i

""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html


""""""""""""""""""""""""""""""
" => PHP section
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.ctp set filetype=php.html
au BufNewFile,BufRead */templates/*.php set filetype=php.html
"autocmd FileType php :set dictionary=~/.vim_runtime/data/dict/php.dict
"au BufNewFile,BufRead *.php set tags+=$HOME/.vim_runtime/data/tags/php.tags
"au BufNewFile,BufRead *.ctp set tags+=$HOME/.vim_runtime/data/tags/php.tags

" $VIMRUNTIME/syntax/php.vim
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
"let g:php_noShortTags   = 1
let g:php_sql_query     = 1

" $VIMRUNTIME/syntax/sql.vim
let g:sql_type_default = 'mysql'

""""""""""""""""""""""""""""""
" => sql section
""""""""""""""""""""""""""""""
augroup sql
    autocmd!
    autocmd BufNew,BufEnter /tmp/sql* setlocal filetype=sql
augroup END

""""""""""""""""""""""""""""""
" => Vue.js section
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.vue setfiletype vue.html

au Filetype vue.html map <leader>bb :set makeprg=cordova\ build\ browser<cr>:make<cr>


""""""""""""""""""""""""""""""
" => Makefile section
""""""""""""""""""""""""""""""
au Filetype make set noexpandtab
au FileType make autocmd! retabBeforeSave


