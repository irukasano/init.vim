
""""""""""""""""""""""""""""""
" deoplete
""""""""""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 1
"
"inoremap <expr><C-h> deoplete#smart_close_popup()."<C-h>"
"inoremap <expr><BS> deoplete#smart_close_popup()."<C-h>"
"
""inoremap <expr><tab> pumvisible() ? "\<C-n>" :
""        \ neosnippet#expandable_or_jumpable() ?
""        \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
"
"call deoplete#custom#option({
"    \ 'auto_complete': v:true,
"    \ 'min_pattern_length': 2,
"    \ 'auto_complete_delay': 0,
"    \ 'auto_refresh_delay': 20,
"    \ 'refresh_always': v:true,
"    \ 'smart_case': v:true,
"    \ 'camel_case': v:true,
"    \ })
"
"call deoplete#custom#option('sources', {
"    \ 'php' : ['omni', 'phpactor', 'ultisnips', 'buffer']
"    \ })
"

""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""
":CocInstall coc-json
":CocInstall coc-phpls
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-phpls',
    "\ 'coc-fzf-preview',
    \ 'coc-tsserver',
    \]

let g:coc_user_config = {}

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

"Diagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
"highlight CocWarningSign ctermfg=0 ctermbg=172

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


""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

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



