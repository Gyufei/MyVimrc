noremap <silent> <F3> :call ToggleTerm()<CR>

function! ToggleTerm()
  if has('terminal')
    if exists(':terminal') == 2
      exec "belowright term++close"
    else 
      normal! <C-W><C-C>
    endif
  endif
endfunc

hi Terminal ctermbg=lightgrey ctermfg=blue guibg=lightgrey guifg=blue
