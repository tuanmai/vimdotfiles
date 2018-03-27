 " Neomake Flowtype
" fyi https://medium.com/@renatoagds/flow-vim-the-long-journey-497e020114e5

let g:neomake_javascript_enabled_makers = ['eslint']
if findfile('.flowconfig', '.;') !=# ''
  "Use locally installed flow
  let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
  if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
  endif
  if executable(local_flow)
    let g:flow_path = local_flow
    let g:neomake_javascript_flow_maker = {
          \ 'exe': 'sh',
          \ 'args': ['-c', g:flow_path.' --json | flow-vim-quickfix'],
          \ 'errorformat': '%E%f:%l:%c\,%n: %m',
          \ 'cwd': '%:p:h' 
          \ }
    let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + [ 'flow']
  endif
endif

" This is kinda useful to prevent Neomake from unnecessary runs
if !empty(g:neomake_javascript_enabled_makers)
  autocmd! BufWritePost * Neomake
endif
