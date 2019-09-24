set completeopt=longest,menu,menuone	      " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

" 回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"	

" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

augroup compmau
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif	 " 离开插入模式后自动关闭预览窗口
augroup END

" coc.nvim
inoremap <silent><expr> <C-x>
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ coc#refresh()

nmap gdf <Plug>(coc-definition)
nmap grs <Plug>(coc-references)

let g:coc_snippet_next = '<C-x>'
let g:coc_global_extensions = [
  \"coc-html",
  \"coc-css",
  \"coc-json",
  \"coc-emmet",
  \"coc-vetur",
  \"coc-angular",
  \"coc-tsserver",
  \"coc-snippets",
  \"coc-git"
  \]

" coc-git 插件
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" git 修改高亮
highlight DiffAdd           cterm=bold ctermbg=237 ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=237 ctermfg=167
highlight DiffChange        cterm=bold ctermbg=237 ctermfg=227
