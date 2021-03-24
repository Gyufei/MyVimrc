  call plug#begin('~/.vim/bundle')
    Plug 'asvetliakov/vim-easymotion'
    Plug 'tpope/vim-surround'
    Plug 'unblevable/quick-scope'
  call plug#end()

  let mapleader = "\<Space>"
  nnoremap <Leader>w :Write<CR>
  nnoremap <Leader>q :Quit<CR>
  nnoremap <Leader>Q :Qall<CR>

  xnoremap <silent> <leader>/ :<C-u>call <SID>openFindFile()<CR>
  nnoremap <silent> <leader>/ :<C-u>call <SID>openFindFile()<CR>
  vnoremap <silent> <leader>/ :<C-u>call <SID>openFindFile()<CR>
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

  function! s:openFindFile()
      normal! gv
      let visualmode = visualmode()
      if visualmode == "V"
          let startLine = line("v")
          let endLine = line(".")
          call VSCodeNotifyRange("workbench.action.findInFiles", startLine, endLine, 1)
      else
          let startPos = getpos("v")
          let endPos = getpos(".")
          call VSCodeNotifyRangePos("workbench.action.findInFiles", startPos[1], endPos[1], startPos[2], endPos[2], 1)
      endif
  endfunction

  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  let g:qs_max_chars=200
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
