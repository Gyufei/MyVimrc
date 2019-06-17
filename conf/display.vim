let s:is_mac=has("mac")
let s:is_linux=has("unix") && !has("macunix") && !has("win32unix")
let s:is_gui=has("gui_running")

if s:is_gui
  if s:is_linux
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 12 " linux 配置
  elseif s:is_mac
    set guifont=Noto_Mono_for_Powerline:h13 "mac&win 字体配置
  endif
endif

if s:is_gui
  set guioptions-=T           " 隐藏工具栏
  set guioptions-=m           " 隐藏菜单栏
  set guioptions-=l           " 禁止显示滚动条
  set guioptions-=L           " 禁止显示滚动条
  set guioptions-=r           " 禁止显示滚动条
  set guioptions-=R           " 禁止显示滚动条

  " gui下的光标的样式变换
  set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
endif
