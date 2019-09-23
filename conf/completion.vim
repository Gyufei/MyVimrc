set completeopt=longest,menu,menuone	      " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

" 回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"	

" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

augroup ycmau
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif	 " 离开插入模式后自动关闭预览窗口
augroup END

  if has('nvim')
" coc.nvim {{{
      inoremap <silent><expr> <C-x>
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ coc#refresh()

      function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      nmap gd <Plug>(coc-definition)
      nmap gr <Plug>(coc-references)

      let g:coc_snippet_next = '<C-x>'
      let g:coc_global_extensions = [
        \"coc-html",
        \"coc-css",
        \"coc-json",
        \"coc-emmet",
        \"coc-vetur",
        \"coc-angular",
        \"coc-tsserver",
        \"coc-snippets"
        \]
" }}}
  else
"" 代码片段插件 UltiSnips {{{
      let g:UltiSnipsExpandTrigger="<c-x>"
      let g:UltiSnipsJumpForwardTrigger="<c-x>"
      let g:UltiSnipsJumpBackwardTrigger="<c-z>"
      " 不遍历查询snip文件，直接去此目录获取
      let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" }}}
  endif
