" 目录树插件 NerdTree {{{
  map <F2> :NERDTreeToggle<CR>
  map <Leader><F2> :NERDTreeFind<CR>
  " 默认显示书签
  let NERDTreeShowBookmarks=1       
  " 忽略文件
  let NERDTreeIgnore=['\c^ntuser\..*']
  let NERDTreeIgnore=['\.pyc$', '\~$', '.DS_Store', '\.swp' ]
  augroup nerdtree
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " 当 NerdTree 为最后一个 window　时自动关闭 
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END

  " 目录树文件颜色区分
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('html', 'cyan', 'none', '#b9d7ea', '#151515')
  call NERDTreeHighlightFile('css', 'lightBlue', 'none', '#25fb73', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#e20062', '#151515')
  call NERDTreeHighlightFile('vue', 'LightGreen', 'none', '#43b67a', '#151515')
  call NERDTreeHighlightFile('ts', 'Red', 'none', '#1f3c6d', '#151515')
  call NERDTreeHighlightFile('json', 'magenta', 'none', '#e0d909', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('style', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('php', 'Red', 'none', '#ff00ff', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" }}}

" 文件查找插件 fzf {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

  let g:fzf_buffers_jump = 1
  let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
  let g:fzf_history_dir = '~/.local/share/fzf-history'

  function! FZFOpen(command_str)
    if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
      exe "normal! \<c-w>\<c-w>"
    endif
    exe 'normal! ' . a:command_str . "\<cr>"
  endfunction

  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
  \   <bang>0)

  function! SearchWord()
    execute 'Rg' expand('<cword>')
  endfunction

  function! SearchVisualSelection() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Rg' selection
  endfunction

  nnoremap <silent> K :call SearchWord()<CR>
  vnoremap <silent> K :call SearchVisualSelection()<CR>

  nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>
  nnoremap <silent> <leader>/ :call FZFOpen(':Rg')<CR>

  nnoremap <silent> <leader>fl :call FZFOpen(':BLines')<CR>
  nnoremap <silent> <leader>fb :call FZFOpen(':Buffers')<CR>
  nnoremap <silent> <leader>gc :call FZFOpen(':Commits')<CR>
  nnoremap <silent> <leader>gb :call FZFOpen(':BCommits')<CR>

  let g:fzf_colors = { 'fg':      ['fg', 'Normal'],
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
  " }}}

" 彩虹括号插件 {{{
  let g:rainbow_active = 0 "0 if you want to enable it later via " :RainbowToggle
  let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
        \               'vue': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold'],
        \               },
	\		'css': 0,
	\	}
	\}
" }}}

" HTML标签配对高亮插件 MatchTagAlways {{{
  " 自定义标签高亮
  let g:mta_use_matchparen_group = 0
  highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
  " 跳转对应标签
  nnoremap <leader>% :MtaJumpToOtherTag<cr>
  let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'vue' : 1,
      \}
" }}}

" 注释插件　NerdComment {{{
  let g:NERDSpaceDelims=1
" }}}

" 平滑滚动插件 {{{
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" }}}

" 移动插件easymotion {{{
  let g:EasyMotion_smartcase = 1  " 忽略大小写
" }}}

" 自动匹配括号插件autoPairs {{{
  let g:AutoPairsShortcutToggle = ''
  let g:AutoPairsShortcutBackInsert = ''
  let g:AutoPairsShortcutFastWrap = ''
  let g:AutoPairShortcutJump = ''
" }}}

"" 标签插件tagbar {{{
  nnoremap <silent> <F8> :TagbarToggle<CR>
  let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
  " Ts tag
  let g:tagbar_type_typescript = {
    \ 'ctagsbin' : 'tstags',
    \ 'ctagsargs' : '-f-',
    \ 'kinds': [
      \ 'e:enums:0:1',
      \ 'f:function:0:1',
      \ 't:typealias:0:1',
      \ 'M:Module:0:1',
      \ 'I:import:0:1',
      \ 'i:interface:0:1',
      \ 'C:class:0:1',
      \ 'm:method:0:1',
      \ 'p:property:0:1',
      \ 'v:variable:0:1',
      \ 'c:const:0:1',
    \ ],
    \ 'sort' : 0
  \ }
  " ultisnips tag
  let g:tagbar_type_snippets = {
    \ 'ctagstype' : 'snippets',
    \ 'kinds' : [
        \ 's:snippets',
    \ ]
  \ }
" }}}

""{{{ 缩进线插件 indent_line
let g:indentLine_enabled = 0
let g:indentLine_setColors = 0
nnoremap <Leader>lt :IndentLinesToggle<CR>
""}}}

" Zen-coding　插件 emmet-vim {{{
  let g:user_emmet_mode='iv'            " 在i 和 v 模式下启用
  let g:user_emmet_leader_key='<tab>'    " 设置快捷键为 tab,
  let g:user_emmet_settings = 0
  let g:user_emmet_install_global = 0

  augroup emmet
    autocmd!
    autocmd FileType html,css,vue EmmetInstall
  augroup END
" }}}

