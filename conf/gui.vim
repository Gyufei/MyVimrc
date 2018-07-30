set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 12 " linux 配置
" set guifont=Noto_Mono_for_Powerline:h14 "mac&win 字体配置

colorscheme molokai         " 颜色主题
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set guioptions-=l           " 禁止显示滚动条
set guioptions-=L           " 禁止显示滚动条
set guioptions-=r           " 禁止显示滚动条
set guioptions-=R           " 禁止显示滚动条

" 选中行样式
hi Visual term=reverse ctermbg=gray guibg=#403D3D

" gui下的光标的样式变换
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" iterm2下光标的样式变换
" if $TERM_PROGRAM =~ "iTerm"
    " let &t_EI = \e[2 q" " Block in normal mode
    " let &t_SI = \e[5 q" " Vertical bar in insert mode
" endif
