set completeopt=longest,menu,menuone	      " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	

" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

augroup ycmau
  autocmd!
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif	 " 离开插入模式后自动关闭预览窗口
augroup END
