if exists('g:vscode')
  source ~/.vim/conf/vscode.vim
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
  " Plug 'easymotion/vim-easymotion'
  Plug 'unblevable/quick-scope'
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
