noremap <silent> <F4> :call ToggleTerm()<CR>
hi Terminal ctermbg=lightgrey ctermfg=blue guibg=lightgrey guifg=blue

function! ToggleTerm()
  if has('terminal')
    if exists(':terminal') == 2
      exec "belowright term++close ++rows=24"
    else 
      normal! <C-W><C-C>
    endif
  endif
endfunc

" iterm2下光标的样式变换
" if $TERM_PROGRAM =~ "iTerm"
    " let &t_EI = \e[2 q" " Block in normal mode
    " let &t_SI = \e[5 q" " Vertical bar in insert mode
" endif
