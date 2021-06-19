
""""""""""""""""""""""""""""""
" deoplete
""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2


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
      \   'gitgutter': 'LightlineGitGutter'
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



