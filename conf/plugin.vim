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

" 注释插件 NerdComment {{{
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

" quick scope 快速跳转 {{{
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  let g:qs_max_chars=200
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" }}}
