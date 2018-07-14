"设置vue文件识别为html
au BufRead,BufNewFile *.vue setfiletype html

" 因为将 vue 文件识别为html文件，所以 ale 为 html 文件加载 js 语法检查
let g:ale_linters = {'html': ['eslint']}
let g:ale_linter_aliases = {'html': 'javascript'}
