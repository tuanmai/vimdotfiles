" set termguicolors
call plug#begin()

Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript', { 'for': '*javascript*' }
Plug 'mxw/vim-jsx', { 'for': '*javascript*' }
Plug 'ternjs/tern_for_vim', { 'for': '*javascript*' }
Plug 'leshill/vim-json'
Plug 'rking/ag.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'majutsushi/tagbar'
Plug 'szw/vim-tags'
Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'skwp/vim-html-escape'
Plug 'justinmk/vim-sneak'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'neomake/neomake'

Plug 'flowtype/vim-flow'

Plug 'vim-scripts/git-time-lapse'

"Comment out stuffs
Plug 'tomtom/tcomment_vim'

Plug 'kassio/neoterm'

Plug 'mhinz/vim-startify'
Plug 'romainl/flattened'
Plug 'Yggdroot/indentLine'

Plug 'bootleq/vim-textobj-rubysymbol'
Plug 'coderifous/textobj-word-column.vim'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mhartington/oceanic-next'

Plug 'jiangmiao/auto-pairs'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'whatyouhide/vim-lengthmatters'

" ES2015 code snippets (Optional)
Plug 'Shougo/neosnippet'
Plug 'epilande/vim-es2015-snippets'

" React code snippets
Plug 'epilande/vim-react-snippets'

" Ultisnips
Plug 'SirVer/ultisnips'
Plug 'kana/vim-submode'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'carlitux/deoplete-ternjs'

Plug 'tpope/vim-surround'

" Plug 'altercation/vim-colors-solarized'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'lifepillar/vim-solarized8'

" Ruby

Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rvm'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/rspec.vim'
Plug 'skwp/vim-iterm-rspec'
Plug 'skwp/vim-spec-finder'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'tpope/vim-bundler'
Plug 'airblade/vim-gitgutter'

" auto reload
autocmd! bufwritepost init.vim source %


call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme OceanicNext
set background=dark
let g:airline_theme='oceanicnext'

let mapleader = ","

"Jump
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <Leader>gc :Gstatus<CR>

nnoremap <Leader><Leader> <C-^>

imap jj <Esc>
imap jk <Esc>

"Remap VIM 0
noremap 0 ^
noremap ^ 0

" ignore case sensitive when searching
:set ignorecase

nnoremap <Leader><Space> :FZF <CR>


"clear highlight search
nnoremap <Esc> :noh<CR><Esc>

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#disable_auto_complete = 0

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'
" Useful maps
" hide/close terminal
nnoremap <Leader>tg :call neoterm#toggle()<cr>

" allow to navigation as normal
au TermOpen *neoterm* :tnoremap <buffer> <Esc> <C-\><C-n>
au TermOpen *neoterm* :tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
au TermOpen *neoterm* :tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
au TermOpen *neoterm* :tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
au TermOpen *neoterm* :tnoremap <buffer> <C-l> <C-\><C-n><C-w>l

"jsx highlight
let g:jsx_ext_required = 0

" Ctrl-w + e shall enable checking
" Ctrl-w + f shall toggle mode
 noremap <C-w>e :SyntasticCheck<CR>
" noremap <C-w>f :SyntasticToggleMode<CR>

nnoremap <F3> :NumbersToggle<CR>

" Enable tmux navigation Ctrl+H
nmap <bs> :<c-u>TmuxNavigateLeft<cr>

let g:neosnippet#enable_snipmate_compatibility = 1

"Indention
set nocompatible
set smartindent
set autoindent
set nowrap
set noexpandtab
set softtabstop=2
set nosmarttab
set formatoptions+=n
set shiftwidth=2
" set encoding=utf-8
set virtualedit=all
set expandtab
set smartcase

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
let javaScript_fold=1

" Font
" https://medium.com/@docodemore/an-alternative-to-operator-mono-font-5e5d040e1c7e#.z15iviagh
let g:Guifont="Operator Mono:h14"
set t_ZH=^[[3m
set t_ZR=^[[23m
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi jsModuleKeywords gui=italic
hi jsModuleOperators gui=italic
hi jsStorageClass gui=italic
hi jsOperator gui=italic
hi jsClassKeywords gui=italic

hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
hi jsModuleKeywords cterm=italic
hi jsModuleOperators cterm=italic
hi jsStorageClass cterm=italic
hi jsOperator cterm=italic

"UI
set number

:imap jk <Esc>

" Tries to find Flow's binary locally, fallback to globally installed
if executable($PWD .'/node_modules/.bin/flow')
  let s:flow_path = $PWD .'/node_modules/.bin/flow'
else
  let s:flow_path = 'flow'
endif

" disable facebook flow check and delegate it to neomake
let g:flow#enable = 1
let g:flow#autoclose = 1

" open quickfix when there's error
let g:neomake_open_list = 1

" Tries to find eslint's binary locally, fallback to globally installed
if executable($PWD .'/node_modules/eslint/bin/eslint.js')
  let s:eslint_path = $PWD .'/node_modules/eslint/bin/eslint.js'
else
  let s:eslint_path = 'eslint'
endif

" " Custom maker that uses `flow-vim-quickfix` to improve the output
" let s:flow_maker = {
"       \ 'exec': s:flow_path.' --json --strip-root | flow-vim-quickfix',
"       \ 'errorformat': '%E%f:%l:%c\,%n: %m',
"       \ 'cwd': '%:p:h'
"       \ }
" " Same thing as above but this time to pass in the maker configuration
" let g:neomake_javascript_flow_maker = s:flow_maker
" let g:neomake_jsx_flow_maker = s:flow_maker
" let g:neomake_javascript_flow_exe = s:flow_path
" let g:neomake_logfile = '/Users/khanghoang/.config/nvim/neomake.log'

let s:eslint_maker = {
      \ 'args': [' --no-color', '--format', 'compact', '--quiet'],
      \ 'errorformat': '%f: line %l\, col %c\, %m',
      \ }

let s:neomake_makers = ['eslint']

" I have to specify two makers because Neomake won't recognize `javascript.jsx`
let g:neomake_javascript_enabled_makers = s:neomake_makers
let g:neomake_jsx_enabled_makers = s:neomake_makers

" eslint maker
let g:neomake_javascript_eslint_maker = s:eslint_maker
let g:neomake_jsx_eslint_maker = s:eslint_maker

" path to bin exec
let g:neomake_javascript_eslint_exe = s:eslint_path

" Trigger linter whenever saving/reading a file
augroup NeomakeLinter
  autocmd!
  autocmd BufWritePost,BufReadPost * Neomake
augroup end

noremap <Leader>ne :lNext<CR>
noremap <Leader>cl :lclose<CR>

" Neo snippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Git time lapse
map <leader>gt :call TimeLapse() <cr>

filetype plugin indent on

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Plug 'matze/vim-move'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <silent> <tab> <Plug>(easymotion-w)

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
let NERDTreeMapOpenSplit = 'x'
let NERDTreeMapOpenVSplit = 'v'
set splitright
set splitbelow

let vimsettings = '~/.vim/nvim_settings'
let uname = system("uname -s")
set clipboard=unnamed

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor
