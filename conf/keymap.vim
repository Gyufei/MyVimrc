let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd %<CR>
nnoremap <Leader>Q :qa<CR>
" 使用sudo命令保存文件
command! W w !sudo tee % > /dev/null

" 窗口切换
nnoremap <c-h> <c-w>h  
nnoremap <c-l> <c-w>l  
nnoremap <c-j> <c-w>j  
nnoremap <c-k> <c-w>k 

" 系统剪切板的复制粘贴
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
" 选中上次粘贴内容
nnoremap <expr> <Leader>vp '`[' . strpart(getregtype(), 0, 1) . '`]'

" 选中模式下使用 * 和 # 搜索选中单词
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

vnoremap <silent> * :<C-u>cal  VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" 右移一格，用于跳出括号
inoremap <c-f> <RIGHT>
inoremap <c-b> <LEFT>

" 清除当前窗口除当前buffer外的所有buffer
function! DeleteAllBuffersInWindow()
  let s:curWinNr = winnr()
  if winbufnr(s:curWinNr) == 1
    ret
  endif

  let s:curBufNr = bufnr("%")
  exe "bn"

  let s:nextBufNr = bufnr("%")

  while s:nextBufNr != s:curBufNr
    exe "bn"
    exe "bdel ".s:nextBufNr
    let s:nextBufNr = bufnr("%")
  endwhile
endfun

noremap <leader>bm :call DeleteAllBuffersInWindow()<CR>

" 重新载入vim配置
nnoremap  <leader>fvr :source ~/.vim/vimrc<CR>

" 进入文件时跳转到上次编辑位置
augroup LastEditPos
  autocmd!
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END
