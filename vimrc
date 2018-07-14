
call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/MatchTagAlways'
Plug 'marijnh/tern_for_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'leafgarland/typescript-vim'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
call plug#end()

" vimrc files
for s:path in split(glob('~/.vim/*.vim'), "\n")
  ec s:path
  exe 'source ' . s:path
endfor

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
augroup END
