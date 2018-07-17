set completeopt=longest,menu	      " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_confirm_extra_conf=0        " 关闭加载.ycm_extra_conf.py提示

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	

" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	 " 离开插入模式后自动关闭预览窗口

" youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']

let g:ycm_cache_omnifunc=1	                " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings=0 "注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
