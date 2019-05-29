" 以下插件配置仅在 vim 中使用, nvim 中使用了其他插件代替

"" 代码片段插件 UltiSnips {{{
  let g:UltiSnipsExpandTrigger="<c-x>"
  let g:UltiSnipsJumpForwardTrigger="<c-x>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  " 不遍历查询snip文件，直接去此目录获取
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" }}}
