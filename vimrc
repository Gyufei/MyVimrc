if exists('g:vscode')
  source ~/.vim/conf/vscode.vim
else
  call plug#begin('~/.vim/bundle')
  Plug 'scrooloose/nerdtree'
  Plug 'mattn/emmet-vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'unblevable/quick-scope'
  call plug#end()

  " vimrc files
  let s:MyVimConfigFiles = [
      \'basic.vim', 
      \'keymap.vim', 
      \'display.vim', 
      \'plugin.vim',
      \'completion.vim',
      \]

  for s:path in s:MyVimConfigFiles
    exe 'source ' .'~/.vim/conf/'.s:path
  endfor
endif
