"  语法检查插件 Ale {{{
  let g:ale_completion_enabled = 1
  let g:ale_set_highlights = 1
  let g:ale_lint_on_enter = 0         " 进入时检查
  let g:ale_sign_column_always = 1    " 始终开启标志列
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_pattern_options = {'\.min\.js$': {'ale_linters': [], 'ale_fixers': []},'\.min\.css$': {'ale_linters': [], 'ale_fixers': []},}
  let g:ale_linters = {
  \   'javascript': ['eslint'], 
  \   'typescript': ['tslint', 'tsserver', 'typecheck'], 
  \   'python': ['flake8'] }

  let g:ale_fixers = {
  \   'javascript': ['eslint'], 
  \   'typescript': ['tslint']
  \}


  let g:ale_sign_error = '✗'          " 自定义error图标
  let g:ale_sign_warning = '⚡'    " 自定义warning图标
  let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
  "显示Linter名称,出错或警告等相关信息
  let g:ale_echo_msg_error_str = '✷ Error'
  let g:ale_echo_msg_warning_str = '⚠ Warning'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

  " 触发/关闭语法检查
  nmap <Leader>et <Plug>(ale_toggle)

  " 格式化
  nmap <Leader>ef <Plug>(ale_fix)

  " 前往上一个错误或警告，
  nmap <Leader>ep <Plug>(ale_previous_wrap)
  " 前往下一个错误或警告
  nmap <Leader>en <Plug>(ale_next_wrap)

  "<Leader>ld查看错误或警告的详细信息
  nmap <Leader>ed <Plug>(ale_detail)

  "<leader>j跳转到定义
  nmap <Leader>jd <Plug>(ale_go_to_definition)
"  }}}

