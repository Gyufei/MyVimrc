set iskeyword+=_,$,@,%,-  " 带有如下符号的单词不要被换行分割
set ignorecase              " 搜索忽略大小写
set hlsearch                " 搜索逐字符高亮
set incsearch               " 搜索逐字符高亮
set selection=inclusive
set selectmode=mouse,key

call plug#begin('~/.vim/bundle')
  Plug 'asvetliakov/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'unblevable/quick-scope'
call plug#end()


let mapleader = "\<Space>"
nnoremap <Leader>w :Write<CR>
nnoremap <Leader>q :Quit<CR>
nnoremap <Leader>Q :Qall<CR>

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d

xnoremap <silent> <leader>/ :<C-u>call <SID>FindSelectedTextInDir()<CR><Esc>

nnoremap <leader>bm <Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>
nnoremap <leader>1 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>
nnoremap <leader>2 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
nnoremap <leader>3 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
nnoremap <leader>4 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
nnoremap <leader>5 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
nnoremap <leader>6 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
nnoremap <leader>7 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
nnoremap <leader>8 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
nnoremap <leader>9 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex9')<CR>

nnoremap <leader>ee <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
nnoremap <leader>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>

nnoremap <c-j> <Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <c-k> <Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>
nnoremap <c-h> <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>
xnoremap <c-h> <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>

function! s:FindSelectedTextInDir() abort
    normal! gv
    if(exists("g:vscode"))
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("workbench.action.findInFiles", startPos[1], endPos[1], startPos[2], endPos[2]+1, 1)
    endif
endfunction

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=200
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
