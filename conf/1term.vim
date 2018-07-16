noremap <silent> <F4> :call ToggleTerm()<CR>

function! ToggleTerm()
  if has('terminal')
    if exists(':terminal') == 2
      exec "belowright term++close ++rows=24"
    else 
      normal! <C-W><C-C>
    endif
  endif
endfunc

hi Terminal ctermbg=lightgrey ctermfg=blue guibg=lightgrey guifg=blue
