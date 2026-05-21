
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => init.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>ss :source $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" depends on color plugin
try
    colorscheme hybrid
    "colorscheme dracula
    "colorscheme melange
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => copy to osc52 (write to /dev/tty)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('osc52.sh')

  function! s:osc52_send(text) abort
    " Neovim では system() で /dev/tty に流す経路が不安定なので、
    " 生成した OSC52 シーケンスを stderr channel へ直接書く。
    if has('nvim')
      let l:osc52 = system('osc52.sh', a:text)
      if v:shell_error == 0
        call chansend(v:stderr, l:osc52)
      endif
      return
    endif

    " Vim は従来どおり /dev/tty へ直接書く。
    call system('osc52.sh | cat > /dev/tty', a:text)
  endfunction

  function! s:osc52_on_yank() abort
    if get(v:event, 'operator', '') ==# 'y'
      call s:osc52_send(getreg('"'))
    endif
  endfunction

  augroup Osc52Yank
    autocmd!
    autocmd TextYankPost * call s:osc52_on_yank()
  augroup END

endif


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

