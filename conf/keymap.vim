let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd %<CR>
nnoremap <Leader>Q :qa<CR>

" 窗口切换
nnoremap <c-h> <c-w>h  
nnoremap <c-l> <c-w>l  
nnoremap <c-j> <c-w>j  
nnoremap <c-k> <c-w>k 

" 系统剪切板的复制粘贴
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" 右移一格，用于跳出括号
inoremap <c-l> <RIGHT>
inoremap <c-k> <LEFT>

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
