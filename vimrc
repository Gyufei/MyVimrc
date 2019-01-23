call plug#begin('~/.vim/bundle')
" 文件查找,目录,标签支持
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

" 语法支持
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
Plug 'cakebaker/scss-syntax.vim'

" 补全和代码片段
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
" Plug 'Valloric/YouCompleteMe'

" 语法检查
Plug 'w0rp/ale'

Plug 'scrooloose/nerdcommenter'

" 界面美化和功能增强
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-smooth-scroll'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
call plug#end()

" vimrc files
let s:MyVimConfigFiles = [
    \'basic.vim', 
    \'term.vim',
    \'keymap.vim', 
    \'gui.vim', 
    \'ycm.vim',
    \'ale.vim',
    \'plugin.vim',
    \'airline.vim',
    \'ft.vim'
    \]

for s:path in s:MyVimConfigFiles
  exe 'source ' .'~/.vim/conf/'.s:path
endfor
