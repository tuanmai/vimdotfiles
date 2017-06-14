 " Neomake Flowtype
" fyi https://medium.com/@renatoagds/flow-vim-the-long-journey-497e020114e5
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:neomake_javascript_enabled_makers = ['eslint']

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if findfile('.flowconfig', '.;') !=# ''
  function! FlowArgs()
    let g:file_path = expand('%:p')
    return ['-c', g:flow_path.' check-contents '.g:file_path.' < '.g:file_path.' --json | flow-vim-quickfix']
  endfunction
  let g:flow_maker = {
        \ 'exe': 'sh',
        \ 'args': function('FlowArgs'),
        \ 'errorformat': '%E%f:%l:%c\,%n: %m',
        \ 'cwd': '%:p:h'
        \ }
  let g:neomake_javascript_flow_maker = g:flow_maker
endif

" This is kinda useful to prevent Neomake from unnecessary runs
if !empty(g:neomake_javascript_enabled_makers)
  autocmd! BufWritePost * Neomake
endif
