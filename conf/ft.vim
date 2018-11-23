
" 编译并运行
func! Compile_Run_Code()
    exec 'w'
    if &filetype == 'c'
        exec '!gcc -Wall -std=c11 -o %:r %:t && ./%:r'
    elseif &filetype == 'go'
        exec '!go build %:t && ./%:r'
    elseif &filetype == 'python'
        exec '!python3 %:t'
    elseif &filetype == 'javascript'
        exec '!node %:t'
    elseif &filetype == 'typescript'
        exec '!tsc %:t && node %:r.js'
    elseif &filetype == 'sh'
        exec '!bash %:t'
    elseif &filetype == 'scss'
        exec '!scss %:t > %:r.css'
    endif
endfunc

nnoremap <leader>mk :call Compile_Run_Code()<cr>

" Vue 类型文件 {{{ 
    " vue 文件中的特定缩写(仅适用于我当前的项目，所以没有加入snippets中的必要
    iabbrev lay layout
    iabbrev laya layout-align=

    " 注释
    let g:ft = ''
    fu! NERDCommenter_before()
      if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
          let syn = synIDattr((stack)[0], 'name')
          if len(syn) > 0
            let syn = tolower(syn)
            exe 'setf '.syn
          endif
        endif
      endif
    endfu

    fu! NERDCommenter_after()
      if g:ft == 'vue'
        setf vue
        g:ft
      endif
    endfu

    " 设置vue补全字典
    function AddVueDict()
      set dict+=~/.vim/dict/vue.txt
      set complete+=k
    endfunction

    augroup VueDict
      autocmd!
      au FileType vue call AddVueDict()
    augroup END
" }}}
