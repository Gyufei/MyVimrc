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

if has('nvim')
  set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
endif
