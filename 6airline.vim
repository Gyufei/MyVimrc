" 状态栏插件 airline {{{
    let g:airline_powerline_fonts = 1   
    let g:airline_theme='solarized_flood'
    
  let g:airline#extensions#keymap#enabled = 1
    " tabline功能
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    " tab前显示tab序号
    let g:airline#extensions#tabline#tab_nr_type = 1 
    let g:airline#extensions#tabline#buffers_label = 'bufs'

    " buffer显示在前面
    let g:airline#extensions#tabline#buf_label_first = 1

    " wordcount
    let g:airline#extensions#wordcount#formatter#default#fmt = '%s W'

    "不显示空格错误提示
    let g:airline#extensions#whitespace#enabled = 0

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

    let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ 't'  : 'T',
        \ }

    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <leader>- <Plug>AirlineSelectPrevTab
    nmap <leader>+ <Plug>AirlineSelectNextTab
" }}}
