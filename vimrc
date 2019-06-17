call plug#begin('~/.vim/bundle')
" 文件查找,目录,标签支持
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 语法支持
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'mxw/vim-jsx'

" 补全和代码片段
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'

if has('nvim')
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
else
  Plug 'SirVer/ultisnips'
endif

" 语法检查
Plug 'w0rp/ale'

" 界面美化和功能增强
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
