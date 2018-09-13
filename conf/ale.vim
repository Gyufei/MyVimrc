"  语法检查插件 Ale {{{
  let g:ale_completion_enabled = 1
  let g:ale_set_highlights = 1
  let g:ale_lint_on_enter = 0         " 进入时检查
  let g:ale_sign_column_always = 1    " 始终开启标志列
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_pattern_options = {'\.min\.js$': {'ale_linters': [], 'ale_fixers': []},'\.min\.css$': {'ale_linters': [], 'ale_fixers': []},}
  let g:ale_linters = {'javascript': ['eslint'],}
  let g:ale_linters = {'typescript': ['tslint'],}
  let g:ale_linters = {'python': ['flake8'],}

  let g:ale_fixers = {
  \   'typescript': ['tslint']
  \}


  let g:ale_sign_error = '✗'          " 自定义error图标
  let g:ale_sign_warning = '⚡'    " 自定义warning图标
  let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
  "显示Linter名称,出错或警告等相关信息
  let g:ale_echo_msg_error_str = '✷ Error'
  let g:ale_echo_msg_warning_str = '⚠ Warning'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

  "普通模式下，zp前往上一个错误或警告，zn前往下一个错误或警告
  nmap zp <Plug>(ale_previous_wrap)
  nmap zn <Plug>(ale_next_wrap)
  "<Leader>w触发/关闭语法检查
  nmap <Leader>lw :ALEToggle<CR>
  "<Leader>d查看错误或警告的详细信息
  nmap <Leader>ld :ALEDetail<CR>
  "<leader>j跳转到定义
  nmap <Leader>jd :ALEGoToDefinition<CR>
"  }}}

