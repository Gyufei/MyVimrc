" 目录树插件 NerdTree {{{
  map <F2> :NERDTreeToggle<CR>
 "默认显示书签
  let NERDTreeShowBookmarks=1       
  " 忽略文件
  let NERDTreeIgnore=['\c^ntuser\..*']
  let NERDTreeIgnore=['\.pyc$', '\~$', '.DS_Store', '\.swp' ]
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " 当 NerdTree 为最后一个 window　时自动关闭 
  " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " 目录树文件颜色区分
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('html', 'yellow', 'none', '#b9d7ea', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', '#25fb73', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#e20062', '#151515')
  call NERDTreeHighlightFile('vue', 'yellow', 'none', '#43b67a', '#151515')
  call NERDTreeHighlightFile('ts', 'Red', 'none', '#1f3c6d', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', '#e0d909', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('style', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('php', 'Red', 'none', '#ff00ff', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" }}}

" 标签插件tagbar {{{
  nnoremap <silent> <F3> :TagbarToggle<CR>
  " Ts 的 tag
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
  " ultisnips 的 tag
  let g:tagbar_type_snippets = {
      \ 'ctagstype' : 'snippets',
      \ 'kinds' : [
          \ 's:snippets',
      \ ]
  \ }
" }}}

" JavaScript 自动补全插件　tern_vim {{{
  let tern_show_signature_in_pum = 1
  let tern_show_argument_hints = 'on_hold'
  let tern#is_show_argument_hints_enabled = 0
  autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
  autocmd FileType javascript setlocal omnifunc=tern#Complete
" }}}

" 代码片段插件 UltiSnips {{{
  let g:UltiSnipsExpandTrigger="<c-x>"
  let g:UltiSnipsJumpForwardTrigger="<c-x>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

" Zen-coding　插件 emmet-vim {{{
  let g:user_emmet_mode='iv'            " 在i 和 v 模式下启用
  let g:user_emmet_leader_key='<tab>'    " 设置快捷键为 tab,
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,vue EmmetInstall
" }}}

" 文件查找插件 CtrlP {{{
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/Library/*    " MacOSX/Linux
" }}}

"  语法检查插件 Ale {{{
  let g:ale_set_highlights = 0
  let g:ale_lint_on_enter = 0         " 进入时检查
  let g:ale_sign_column_always = 1    " 始终开启标志列
  let g:ale_completion_enabled = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_pattern_options = {'\.min\.js$': {'ale_linters': [], 'ale_fixers': []},'\.min\.css$': {'ale_linters': [], 'ale_fixers': []},}
  let g:ale_linters = {'javascript': ['eslint'],}
  let g:ale_linters = {'typescript': 'tslint',}
  let g:ale_linters = {'python': ['flake8'],}


  let g:ale_sign_error = '✗'          " 自定义error图标
  let g:ale_sign_warning = '⚡'    " 自定义warning图标
  let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
  "显示Linter名称,出错或警告等相关信息
  let g:ale_echo_msg_error_str = '✷ Error'
  let g:ale_echo_msg_warning_str = '⚠ Warning'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

  "普通模式下，zp前往上一个错误或警告，zn前往下一个错误或警告
  nmap zp <Plug>(ale_previous_wrap)
  nmap zn <Plug>(ale_next_wrap)
  "<Leader>w触发/关闭语法检查
  nmap <Leader>lw :ALEToggle<CR>
  "<Leader>d查看错误或警告的详细信息
  nmap <Leader>ld :ALEDetail<CR>
  "<leader>j跳转到定义
  nmap <Leader>jd :ALEGoToDefinition<CR>
"  }}}

" 彩虹括号插件 {{{
  let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

  let g:rbpt_max = 16
  let g:rbpt_loadcmd_toggle = 0
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
" }}}

" HTML标签配对高亮插件 MatchTagAlways {{{
  " 自定义标签高亮
  let g:mta_use_matchparen_group = 0
  highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
  " 跳转对应标签
  nnoremap <leader>% :MtaJumpToOtherTag<cr>
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

" 全局搜索内容插件 ag.vim {{{
  let g:ag_prg="ag --vimgrep --smart-case"
  let g:ag_working_path_mode='r'
  let g:ag_highlight=1

  " 配置 Ag 命令为快捷键 ge
  vnoremap <silent> ge "ge:Ag "
  nnoremap <c-f> :Ag 
" }}}

" git文件修改状态插件 gitGutter {{{
  set updatetime=100             " 设置vim文件刷新时间为1ms
  let g:gitgutter_max_signs=200  " 显示的标志数量，默认为500
  let g:gitgutter_map_keys = 0   " 不设置任何插件快捷键
" }}}

" 移动插件easymotion {{{
  let g:EasyMotion_smartcase = 1  " 忽略大小写
" }}}
