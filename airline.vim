" 状态栏插件 airline {{{
    let g:airline_powerline_fonts = 1   
    let g:airline_theme='solarized_flood'
    " 打开tabline功能
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    " 打开branch 功能
    let g:airline#extensions#branch#enabled=1

    " 当文件为UTF-8时，不显示文件格式
    let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''
    let g:airline#extensions#branch#enabled = 1

    " ale
    let g:airline#extensions#ale#enabled = 1
    let airline#extensions#ale#error_symbol = 'E:'
    let airline#extensions#ale#warning_symbol = 'W:'
    let airline#extensions#ale#show_line_numbers = 1
    let airline#extensions#ale#open_lnum_symbol = '(L'
    let airline#extensions#ale#close_lnum_symbol = ')'

    " gitGutter
    let g:airline#extensions#hunks#enabled = 1
    let g:airline#extensions#hunks#non_zero_only = 0
    let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nnoremap <leader>1 <Plug>AirlineSelectTab1
    nnoremap <leader>2 <Plug>AirlineSelectTab2
    nnoremap <leader>3 <Plug>AirlineSelectTab3
    nnoremap <leader>4 <Plug>AirlineSelectTab4
    nnoremap <leader>5 <Plug>AirlineSelectTab5
    nnoremap <leader>6 <Plug>AirlineSelectTab6
    nnoremap <leader>7 <Plug>AirlineSelectTab7
    nnoremap <leader>8 <Plug>AirlineSelectTab8
    nnoremap <leader>9 <Plug>AirlineSelectTab9
    nnoremap <leader>- <Plug>AirlineSelectPrevTab
    nnoremap <leader>+ <Plug>AirlineSelectNextTab
" }}}
