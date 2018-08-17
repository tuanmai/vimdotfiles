" set termguicolors
call plug#begin()
" UI
Plug 'jacoborus/tender.vim'
Plug 'Yggdroot/indentLine'

" Navigator
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'Lokaltog/vim-easymotion'
" Plug 'tpope/vim-endwise'
" Plug 'godlygeek/tabular'
" Plug 'ternjs/tern_for_vim', { 'for': '*javascript*' }
" Plug 'leshill/vim-json'
" Plug 'skwp/vim-html-escape'
" Plug 'justinmk/vim-sneak'
" Plug 'neomake/neomake'
" Plug 'mhinz/vim-startify'
" Plug 'wokalski/autocomplete-flow'
" Plug 'epilande/vim-es2015-snippets'
" Plug 'epilande/vim-react-snippets'
" Plug 'sbdchd/neoformat'
" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
"
" Utils
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'


" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

let $MYVIMRC = '$HOME/.config/nvim/init.vim'


" Theme
if (has("termguicolors"))
 set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
colorscheme tender


" Map leader
let mapleader = ","


"Jump
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <Leader><Leader> <C-^>
imap jj <Esc>
imap jk <Esc>


"Remap VIM 0
noremap 0 ^
noremap ^ 0


" ignore case sensitive when searching
:set ignorecase


"FZF configs
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <Leader><Space> :FZF <CR>
nnoremap <silent> <leader>w :Ag! <C-R><C-W><CR>

"clear highlight search
nnoremap <Esc> :noh<CR><Esc>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"indention
set nocompatible
set smartindent
set autoindent
set nowrap
set noexpandtab
set softtabstop=2
set nosmarttab
set formatoptions+=n
set shiftwidth=2
set virtualedit=all
set expandtab
set smartcase
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
let javascript_fold=1
set hidden


" font
" https://medium.com/@docodemore/an-alternative-to-operator-mono-font-5e5d040e1c7e#.z15iviagh
let g:guifont="operator mono:h14"
set t_zh=^[[3m
set t_zr=^[[23m
hi htmlarg gui=italic
hi comment gui=italic
hi type    gui=italic
hi jsmodulekeywords gui=italic
hi jsmoduleoperators gui=italic
hi jsstorageclass gui=italic
hi jsOperator gui=italic
hi jsClassKeywords gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
hi jsModuleKeywords cterm=italic
hi jsModuleOperators cterm=italic
hi jsStorageClass cterm=italic
hi jsOperator cterm=italic
hi Visual ctermbg=152 guibg=#B2DFE0
set number
set lazyredraw
set relativenumber
set scrolloff=10

filetype plugin indent on



" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
let NERDTreeMapOpenSplit = 'x'
let NERDTreeMapOpenVSplit = 'v'
set splitright
set splitbelow



" Set clipboard
let uname = system("uname -s")
set clipboard=unnamed


" Map reverse search to /
noremap \ ,


" Multi cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key=',mc'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" Set line indent color
let g:indentLine_color_term=240


" Toggle NERDTree
let NERDTreeShowHidden = 1
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>
"
"
"
 " Edit and source configs
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>


 " Ale configs
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_javascript_eslint_options = "--quiet"
let g:ale_linters = {
\   'javascript': [ 'eslint', 'flow' ],
\   'ruby': []
\ }
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint', 'importjs'],
\}
nmap <silent> <leader>aj :ALENext<CR>
nmap <silent> <leader>ak :ALEPrevious<CR>


" Deoplete configs
let g:deoplete#enable_at_startup = 1


 " LightLine config
let g:lightline = {
      \ 'colorscheme': 'tenderplus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'gutentags' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'gutentags': 'gutentags#statusline',
      \ },
      \ }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ]
      \ }


" Refresh statusline after Gutentags background process has ended
augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END


" Convert slashes to backslashes for Windows.
if has('win32')
  nmap ,cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap ,cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap ,cs :let @*=expand("%")<CR>
  nmap ,cl :let @*=expand("%:p")<CR>
endif


" Easymotion
let g:EasyMotion_keys='asdfjkoweriop'
nmap ,<ESC> ,,w
nmap ,<S-ESC> ,,b


" Set mouse scroll
set mouse=a


" Vim surround
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #
" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>
" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>
" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>
" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>
" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>
" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>
map ,` ysiw`
