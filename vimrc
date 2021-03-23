if exists('g:vscode')
  call plug#begin('~/.vim/bundle')
    Plug 'asvetliakov/vim-easymotion'
  call plug#end()

  let mapleader = "\<Space>"
  nnoremap <Leader>w :Write<CR>
  nnoremap <Leader>q :Quit<CR>
  nnoremap <Leader>Q :Qall<CR>

  xnoremap <silent> <leader>/ :<C-u>call <SID>openFindFile()<CR>
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
else
  call plug#begin('~/.vim/bundle')
  " �ļ�����,Ŀ¼,��ǩ֧��
  Plug 'scrooloose/nerdtree'
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " �﷨֧��
  Plug 'pangloss/vim-javascript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'posva/vim-vue', { 'for': 'vue' }
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'mxw/vim-jsx'

  " ��ȫ�ʹ���Ƭ��
  Plug 'mattn/emmet-vim'
  Plug 'scrooloose/nerdcommenter'

  if (has('nvim'))
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
  endif

  " �﷨���
  Plug 'w0rp/ale'

  " ���������͹�����ǿ
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'maximbaz/lightline-ale'

  Plug 'luochen1990/rainbow'

  Plug 'Valloric/MatchTagAlways'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'easymotion/vim-easymotion'
  Plug 'ryanoasis/vim-devicons'

  Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }
  call plug#end()

  " vimrc files
  let s:MyVimConfigFiles = [
      \'basic.vim', 
      \'term.vim',
      \'keymap.vim', 
      \'display.vim', 
      \'ale.vim',
      \'plugin.vim',
      \'statusline.vim',
      \'completion.vim',
      \'ft.vim'
      \]

  for s:path in s:MyVimConfigFiles
    exe 'source ' .'~/.vim/conf/'.s:path
  endfor
endif
