
call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim'
Plug 'leafgarland/typescript-vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/MatchTagAlways'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'posva/vim-vue'
Plug 'majutsushi/tagbar'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" vimrc files
for s:path in split(glob('~/.vim/conf/*.vim'), "\n")
  exe 'source ' . s:path
endfor

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
augroup END
