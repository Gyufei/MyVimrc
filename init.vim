call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'marijnh/tern_for_vim'
Plug 'leafgarland/typescript-vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/MatchTagAlways'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'posva/vim-vue'
Plug 'majutsushi/tagbar'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
call plug#end()

" vimrc files
let s:MyVimConfigFiles = [
    \'basic.vim', 
    \'term.vim',
    \'keymap.vim', 
    \'gui.vim', 
    \'coc.vim',
    \'ale.vim',
    \'plugin.vim',
    \'airline.vim',
    \'ft.vim'
    \]

for s:path in s:MyVimConfigFiles
  exe 'source ' .'~/.vim/conf/'.s:path
endfor
