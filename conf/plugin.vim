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

" 文件查找插件 CtrlP {{{
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|lock)$'
  \ }
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/Library/*    " MacOSX/Linux
" }}}

" 彩虹括号插件 {{{
  let g:rainbow_active = 1 "0 if you want to enable it later via " :RainbowToggle
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

" 全局搜索内容插件 ctrlsf.vim {{{
  " 是否自动关闭
  let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
  \ }
  " 自动聚焦到结果窗口
  let g:ctrlsf_auto_focus = {
  \ "at" : "done",
  \ "duration_less_than": 1000
  \ }
  " 忽略文件
  let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules']
  " 单行显示
  let g:ctrlsf_default_view_mode='compact'
  " 基于vbs项目搜索
  let g:ctrlsf_default_root='project'
  " 结果窗口位置
  let g:ctrlsf_position = 'bottom'
  " 文件名和结果间的空格数
   let g:ctrlsf_indent = 2

  " 配置 CtrlSF 命令为快捷键 ge
  nmap <Leader>/ <Plug>CtrlSFPrompt
  " 结果窗口中的快捷键
  let g:ctrlsf_mapping = {
  \ "next": "<C-n>",
  \ "prev": "<C-p>",
  \ }
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

" coc-git 插件 {{{
    " navigate chunks of current buffer
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)

  " git 修改高亮
  highlight DiffAdd           cterm=bold ctermbg=237 ctermfg=119
  highlight DiffDelete        cterm=bold ctermbg=237 ctermfg=167
  highlight DiffChange        cterm=bold ctermbg=237 ctermfg=227
" }}}
