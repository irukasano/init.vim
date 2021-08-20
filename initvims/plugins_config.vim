
""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-tsserver',
    \ 'coc-phpls',
    \ 'coc-python',
    \]

let g:coc_user_config = {}

"highlight CocFloating ctermfg=0 ctermbg=13
"highlight CocErrorFloat ctermfg=0 ctermbg=13
"highlight CocErrorSign ctermfg=0 ctermbg=13
"highlight CocWarningSign ctermfg=0 ctermbg=172
"highlight CocMenuSel cterm=bold ctermfg=14 guifg=#40ffff

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"CocList
nmap <silent> <leader><leader> :<C-u>CocList<cr>
"Hover
nmap <silent> <leader>hov :<C-u>call CocAction('doHover')<cr>
"Definition
nmap <silent> <leader>def :call CocAction('jumpDefinition', 'split')<cr>
"References
nmap <silent> <leader>ref <Plug>(coc-references)
"nmap <silent> <leader>ref :call CocAction('jumpReferences', 'split')<cr>
"Rename
nmap <silent> <leader>ren <Plug>(coc-rename)
"Format
nmap <silent> <leader>fmt <Plug>(coc-format)
"Implementation
nmap <silent> <leader>imp <Plug>(coc-implementation)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

"augroup mygroup
"    autocmd!
"    " Setup formatexpr specified filetype(s).
"    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"    " Update signature help on jump placeholder.
"    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup en

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>fix  <Plug>(coc-fix-current)

"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"


""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>fa :<C-u>Ag<CR>
nnoremap <silent> <leader>fp :<C-u>ProjectFiles<CR>
nnoremap <silent> <leader>fb :<C-u>Buffers<CR>
nnoremap <silent> <leader>fh :<C-u>History<CR>
nnoremap <silent> <leader>fc :<C-u>Commits<CR>
nnoremap <silent> <leader>fs :<C-u>GFiles?<CR>

function! s:find_git_root()
    " プロジェクトルートで開く
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
"command! -bang -nargs=? -complete=dir Files
"    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu
"autocmd  FileType fzf set ambiwidth=single

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"ambiwidth=single でないと枠線がずれるが、doubleでないと日本語等がずれる
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'border': 'rounded' } }
"let g:fzf_layout = { 'down': '~40%' }
" [Buffers] Jump to the existing window if possible

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
"let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let $FZF_DEFAULT_OPTS='--border=sharp --no-unicode'


""""""""""""""""""""""""""""""
" fern
""""""""""""""""""""""""""""""
function! s:init_fern() abort
  set foldcolumn=0
  set nonumber
endfunction

let g:fern#renderer = 'nerdfont'
map <leader>nn :Fern . -reveal=% -drawer -toggle -width=40<CR>
map <leader>nb :Fern bookmark:///<CR>

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:lightline_unmodifiable_char = "\u26d4"
let s:lightline_modified_char = "\u270f"
let s:lightline_readonly_char = "\ue0a2"
let g:lightline = {
      \ 'colorscheme': 'selenized_white',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['readonly', 'modified', 'fugitive', 'gitgutter', 'filename', 'dirname']],
      \   'right': [ ['lineinfo', 'percent'],
      \              ['fileformat','fileencoding', 'filetype'] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['mode'], ['filename']],
      \   'right': []
      \ },
      \ 'tab': {
      \   'active': ['tabnum', 'filename', 'readonly', 'modified'],
      \   'inactive': ['tabnum', 'filename', 'readonly', 'modified']
      \ },
      \ 'component': {
      \ },
      \ 'component_visible_condition': {
      \ },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename',
      \   'dirname': 'LightlineDirname',
      \   'filetype': 'LightlineFiletype',
      \   'fileformat': 'LightlineFileformat',
      \   'fileencoding': 'LightlineFileencoding',
      \   'fugitive': 'LightlineFugitive',
      \   'mode': 'LightlineMode',
      \   'gitgutter': 'LightlineGitGutter',
      \   'cocstatus': 'coc#status'
      \ },
      \ 'component_function_visible_condition': {
      \ },
      \ 'component_expand': {
      \   'lineinfo': 'LightlineLineinfo',
      \   'percent': 'LightlinePercent'
      \ },
      \ 'tab_component_function': {
      \   'filename': 'LightlineTabFilename',
      \   'modified': 'LightlineTabModified',
      \   'readonly': 'LightlineTabReadonly',
      \   'tabnum': 'LightlineTabTabnum'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

"      if you cant use powerline font, use below
"      \ 'separator': { 'left': "", 'right': "" },
"      \ 'subseparator': { 'left': "\u239f", 'right': "\u239f" }
"
"      if you can use powerline font, use below
"      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }


function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let ft = gettabwinvar(a:n, winnr, '&filetype')
  if ft ==# "nerdtree"
    return 'NERD'
  endif
  if ft ==# "fern"
    return 'FERN'
  endif
  if ft ==# "help"
    return 'HELP'
  endif
  if ft ==# "taglist"
    return 'TAG'
  endif

  "let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  "let _ = expand('#'.buflist[winnr - 1].':p')
  let _ = expand('#'.buflist[winnr - 1])
  let icon = WebDevIconsGetFileTypeSymbol(_)
  if _ ==# ''
    return '[No Name]'
  endif
  let h1 = expand('#'.buflist[winnr - 1].':p:h:h:t')
  let h2 = expand('#'.buflist[winnr - 1].':p:h:t')
  let f = expand('#'.buflist[winnr - 1].':t')
  return icon." ".h1."/".h2."/".f
endfunction

function! LightlineTabModified(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified') ? s:lightline_modified_char :
    \ gettabwinvar(a:n, winnr, '&modifiable') ? '' : s:lightline_unmodifiable_char
endfunction

function! LightlineTabReadonly(n) abort
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&readonly') ? s:lightline_readonly_char : ''
endfunction

function! LightlineTabTabnum(n) abort
  return a:n.')'
endfunction

function! LightlineReadonly()
  if &ft ==# "help" || &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  if &readonly
    return s:lightline_readonly_char
  endif
  return ''
endfunction

function! LightlineModified()
  if &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  if &modified
    return s:lightline_modified_char
  endif
  if !&modifiable
    return s:lightline_unmodifiable_char
  endif
  return ''
endfunction

function! LightlineFugitive()
  if &ft ==# "help" || &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  if "" ==# fugitive#Head()
    return ''
  endif
  let _ = fugitive#head()
  "return strlen(_) ? _ : ''
  return strlen(_) ? '' . _ : ''
endfunction

function! LightlinePercent()
  if &ft ==# "help" || &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  return '%3p%%'
endfunction

function! LightlineLineinfo()
  if &ft ==# "help" || &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  return '%4l:%3v'
endfunction

function! LightlineFileencoding()
  if &ft ==# "help" || &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  return (strlen(&fenc) ? &fenc : &enc)
endfunction

function! LightlineFileformat()
  if &ft ==# "help" || &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  return &fileformat . ' ' . WebDevIconsGetFileFormatSymbol()
endfunction

function! LightlineFiletype()
  if &ft ==# "help" || &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  let icon = WebDevIconsGetFileTypeSymbol()
  return icon . ' ' . &ft
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  if &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  return (fname !=# '' ? fname : '[No Name]')
endfunction

function! LightlineDirname()
  let fname = expand('%:p:h')
  if &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  return (fname !=# '' ? fname : '[No Name]')
endfunction

function! LightlineGitGutter()
  if &ft ==# "help" || &ft ==# "nerdtree" || &ft ==# "fern" || &ft ==# "taglist"
    return ''
  endif
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 50
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

function! LightlineMode()
  return  &ft == 'unite' ? 'Unite' :
          \ &ft == 'vimfiler' ? 'VimFiler' :
          \ &ft == 'vimshell' ? 'VimShell' :
          \ &ft == 'nerdtree' ? 'NERD' :
          \ &ft == 'fern' ? 'FERN' :
          \ &ft == 'taglist' ? 'TAG' :
          \ lightline#mode()
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-better-whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * :%s/\t/    /ge
"let g:better_whitespace_ctermcolor='23'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"    highlight = {
"        enable = true,              -- false will disable the whole extension
"        disable = { "vue", "ruby" },  -- list of language that will be disabled
"    },
"}
"EOF

