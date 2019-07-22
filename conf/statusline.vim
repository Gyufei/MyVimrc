let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox8'
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

" statusLine gruvbox 主题 {{{{
let s:red     = [ '#cc241d', 124 ]
let s:red1     = [ '#9d0006', 88 ]
let s:green   = [ '#98971a', 106 ]
let s:yellow  = [ '#d79921', 172 ]
let s:blue = [ '#458588', 66 ]
let s:blue1 = [ '#0087d7', 32 ]
let s:purple   = [ '#b16286', 132 ]
let s:purple1 = [ '#875faf', 97]
let s:aqua   = [ '#689d6a', 72 ]
let s:orange   = [ '#d65d0e', 166 ]
let s:gray = [ '#a89984', 246 ]
let s:bg = [ '#282828', 235 ]
let s:bg0 = [ '#282828', 235 ]
let s:bg0_h = ['#1d2021',234]
let s:bg1 = [ '#3c3836', 237 ]
let s:bg2 = [ '#504945', 239 ]
let s:bg3 = [ '#665c54', 241 ]
let s:bg_icon = ['#444444',238]
let s:bg4 = [ '#7c6f64', 243 ]
let s:fg0 = [ '#fbf1c7', 229 ]
let s:fg1 = [ '#ebdbb2', 223 ]
let s:fg2 = [ '#d5c4a1', 250 ]
let s:fg3 = [ '#bdae93', 248 ]
let s:fg4 = [ '#a89984', 246 ]



let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}
  let s:p.normal.left = [ [ s:bg0, s:green, 'bold' ], [ s:fg4, s:bg3] ,[s:fg3,s:bg4],[s:blue1,s:bg_icon]]
  let s:p.normal.right = [ [ s:bg0, s:green ], [ s:bg0, s:fg4 ],[ s:bg0, s:bg4 ] ,[s:red,s:bg1],[s:blue1,s:bg1],[s:orange,s:bg1]]
  let s:p.normal.middle = [ [ s:fg4, s:bg1 ] ]
  let s:p.normal.error = [ [ s:bg0, s:orange ] ]
  let s:p.normal.warning = [ [ s:bg2, s:yellow ] ]

  let s:p.insert.left = [ [ s:bg0, s:blue, 'bold'], [ s:fg4, s:bg3],[ s:fg3, s:bg4] ,[s:blue1,s:bg_icon]]
  let s:p.insert.right = [ [ s:bg0, s:blue ], [ s:bg0, s:fg4 ],[ s:bg0, s:bg4 ] ,[s:red,s:bg1],[s:blue1,s:bg1],[s:orange,s:bg1]]
  let s:p.insert.middle = [ [ s:fg4, s:bg1 ] ]

  let s:p.replace.left = [ [ s:bg0, s:aqua, 'bold' ], [ s:fg1, s:bg0 ] ,[ s:fg3, s:bg4] ,[s:blue1,s:bg_icon]]
  let s:p.replace.right = [ [ s:bg0, s:aqua ], [ s:bg0, s:fg4 ],[ s:bg0, s:bg4 ] ,[s:red,s:bg1],[s:blue1,s:bg1],[s:orange,s:bg1]]
  let s:p.replace.middle = [ [ s:fg4, s:bg1 ] ]

  let s:p.visual.left = [ [ s:bg0, s:orange, 'bold' ], [ s:fg1, s:bg0 ],[s:fg3,s:bg4],[s:blue1,s:bg_icon]]
  let s:p.visual.right = [ [ s:bg0, s:orange ], [ s:bg0, s:fg4 ],[ s:bg0, s:bg4 ] ,[s:red,s:bg1],[s:blue1,s:bg1],[s:orange,s:bg1]]
  let s:p.visual.middle = [ [ s:fg4, s:bg1 ] ]

  let s:p.inactive.right = [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
  let s:p.inactive.left =  [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
  let s:p.inactive.middle = [ [ s:bg4, s:bg1 ] ]

  let s:p.terminal.left = [ [ s:bg0, s:green, 'bold' ], [ s:fg1, s:bg2 ] ]
  let s:p.terminal.right = [ [ s:bg0, s:green ], [ s:fg1, s:bg2 ] ]
  let s:p.terminal.middle = [ [ s:fg4, s:bg2 ] ]

  let s:p.tabline.left = [ [ s:fg4, s:bg1 ] ]
  let s:p.tabline.tabsel = [ [ s:bg0, s:green ] ]
  let s:p.tabline.middle = [ [ s:bg0, s:bg0 ] ]
  let s:p.tabline.right = [ [ s:bg0, s:orange ] ]

  let g:lightline#colorscheme#gruvbox8#palette = lightline#colorscheme#flatten(s:p)
" }}}}
