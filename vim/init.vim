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

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'dunckr/js_alternate.vim'

" Reason
Plug 'reasonml-editor/vim-reason-plus'

" Scala
Plug 'derekwyatt/vim-scala'
" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Utils
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
Plug 'galooshi/vim-import-js'

" Integration

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'


" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'Chiel92/vim-autoformat'

" Elixir
Plug 'elixir-editors/vim-elixir'


"Utils
Plug 'segeljakt/vim-silicon'



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
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" https://github.com/junegunn/fzf.vim/issues/413#issuecomment-320197362
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

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
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
" set foldlevel=2
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
"

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
\   'javascript': ['prettier', 'eslint'],
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
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ]
      \ }


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

 "========================================================
" CONFIG COC.nvim
"========================================================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <leader>ld :call CocAction('jumpDefinition')<CR>
nnoremap <leader>lf :call CocAction('format')<CR>
nnoremap <leader>lh :call CocAction('doHover')<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
j
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nnoremap <leader>rn <Plug>(coc-rename)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


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


" ==== NERD tree
" Open the project tree and expose current file in the nerdtree with Ctrl-\
" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>


" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>


" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cr :let @* = expand("%")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

"(v)im (c)ommand - execute current line as a vim command
nmap <silent> ,vc yy:<C-f>p<C-c><CR>

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>


" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Tmux vim config
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>


" Autoformat for ruby
let g:formatters_ruby = ['rubocop']

" Json comment highlight
autocmd FileType json syntax match Comment +\/\/.\+$+


"
let g:fzf_history_dir='~/.local/share/fzf-history'
