let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
let g:lightline.active = {
  \  'left': [
  \            [ 'mode', 'paste' ],
  \            [ 'fugitive', 'filename', 'modified' ],
  \            ['ctrlpmark']
  \          ],
  \  'right': [
  \            [ 'lineinfo' ],
  \            ['percent'],
  \            [ 'fileformat', 'fileencoding', 'filetype' ],
  \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
  \           ]
  \ } 
let g:lightline.component = {
  \  'lineinfo': '⭡ %3l:%-2v',
  \}
let g:lightline.component_function = {
  \  'mode': 'LightlineMode',
  \  'filename': 'LightlineFilename',
  \  'readonly': 'LightlineReadonly',
  \  'fugitive': 'LightlineGitBranch',
  \  'fileformat': 'LightlineFileformat',
  \  'fileencoding': 'LightlineFileencoding',
  \  'filetype': 'LightlineFiletype',
  \  'ctrlpmark': 'CtrlPMark'
  \ }
let g:lightline.tabline = {
  \    'left': [ [ 'buffers' ] ],
  \    'right': [ [ 'close' ] ] 
  \}
let g:lightline.component_expand = {
  \  'buffers': 'lightline#bufferline#buffers',
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok'
  \ }
let g:lightline.component_type = { 
  \  'buffers': 'tabsel',
  \  'linter_checking': 'left',
  \  'linter_warnings': 'warning',
  \  'linter_errors': 'error',
  \  'linter_ok': 'left'
  \ }
let g:lightline.mode_map = {
  \  'n'  : 'N',
  \  'i'  : 'I',
  \  'R'  : 'R',
  \  'v'  : 'V',
  \  'V' : 'V-L',
  \  "\<C-v>": 'V-B',
  \  'c'  : 'C',
  \  's'  : 'S',
  \  'S'  : 'S',
  \  '\<C-s>' : 'S-B',
  \  't'  : 'Term',
  \ }
let g:lightline.separator = { 'left': '⮀', 'right': '⮂' }
let g:lightline.subseparator = { 'left': '⮁', 'right': '⮃' } 

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineGitBranch()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler'
      " let mark = '⭠'  " edit here for cool mark
      let branch = get(g:, 'coc_git_status')
      return branch !=# '' ? branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
    \ fname == 'ControlP' ? 'CtrlP' :
    \ fname == '__Gundo__' ? 'Gundo' :
    \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
    \ fname =~ 'NERD_tree' ? 'NERDTree' :
    \ &ft == 'unite' ? 'Unite' :
    \ &ft == 'vimfiler' ? 'VimFiler' :
    \ &ft == 'vimshell' ? 'VimShell' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
      \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'
function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction


let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" lightline-Buffers
set showtabline=2
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
