set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-rsi'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'raimondi/delimitmate'
Plugin 'itchyny/lightline.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mhinz/vim-startify'
Plugin 'mhinz/vim-signify'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'yggdroot/indentline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'junegunn/vim-easy-align'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'kshenoy/vim-signature'
Plugin 'ryanoasis/vim-devicons'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'kana/vim-operator-user'
Plugin 'haya14busa/vim-metarepeat'
Plugin 'bkad/CamelCaseMotion'
Plugin 'terryma/vim-expand-region'
Plugin 'vim-scripts/gitignore'
Plugin 'djoshea/vim-autoread'
Plugin 'wellle/targets.vim'
Plugin 'FooSoft/vim-argwrap'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'elzr/vim-json'
Plugin 'moll/vim-node'
Plugin 'othree/javascript-libraries-syntax.vim'

" Angular
Plugin 'burnettk/vim-angular'

" EJS
Plugin 'briancollins/vim-jst'

" RAML
Plugin 'in3d/vim-raml'

" HTML
Plugin 'alvan/vim-closetag'

" Themes
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'

""" General {
syntax on
filetype plugin indent on

" set number

" change the mapleader from \ to ,
let mapleader=","

" set term=xterm-256color
set t_Co=256
set background=dark

try
    colorscheme gruvbox
catch
    colorscheme default
endtry

" set dark background for Gvim as well
hi Normal guifg=White guibg=Black

set formatoptions+=or

set undofile
set undodir=~/.tmp

" Show line numbers
set number

" opening a new file when the current buffer has unsaved
" changes causes fileto be hidden instead of closed
set hidden

" always set autoindenting on
set autoindent
" copy the previous indentation on autoindenting
set copyindent
set preserveindent
set smarttab
set expandtab
set shiftround
set softtabstop=2
" number of spaces to use for autoindenting
set shiftwidth=2
" a tab is 2 spaces
set tabstop=2
set wrap

" Folding
set foldmethod=manual

" Wild menu conf
set wildmenu
set wildmode=longest:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Incremental search (while typing)
set incsearch
" Ignore case on search
set ignorecase
" If the search string contains capitalized letters, so it's case sensitive
set smartcase
set ffs=unix,dos,mac

" change the terminal's title
set title
" don't beep
set visualbell
" don't beep
set noerrorbells

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Split pannels conf
set splitbelow
set splitright

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" start scrolling when cursor is N lines from the top/bottom edge
set scrolloff=10

" set show matching parenthesis
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"Recursively set the path of the project.
set path=$PWD/**

" Set utf8 as standard encoding
set encoding=utf8

" Not show current line for each minimized file
set wmw=0

" Abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" Better Unix / Windows compatibility
set viewoptions=folds,options,cursor,unix,slash

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Enables current line highlight
set cursorline

""" }

""" custom mappings {

" Moves between panels
noremap <c-h> <c-w><c-h>
noremap <c-l> <c-w><c-l>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>

" Remove search highligh
noremap <silent> <Leader>. :nohlsearch<CR>

" Open tag
nnoremap <C-O> <C-]>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee % >/dev/null

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Moves for wrapped lines
noremap j gj
noremap k gk

" Emacs like shortcuts in insert mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" Make Y behaves like C and D
noremap Y y$

" Clipboard copy and paste
noremap <leader><leader>y "+y
noremap <leader><leader>Y "+y$
noremap <leader><leader>p "+p
noremap <leader><leader>P "+P

" Automatically jump to end of text pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Allows easy replacement of the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

" quickly select pasted text
noremap gV `[v`]

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Map <Space> to / (search)
map <space> /

" Replace text in quotes
nmap <leader>cd ci"
nmap <leader>cs ci'

" Bring the 2nd MRU buffer to screen
nnoremap <silent> <leader>bb :e #<CR>
nnoremap <silent> <tab> :e #<CR>

" Toggle line numbers
noremap <silent> <F10> :set number!<CR>
inoremap <silent> <F10> <C-o>:set number!<CR>
cnoremap <silent> <F10> <C-c>:set number!<CR>
" Toggle relative line numbers
noremap <silent> <F12> :set relativenumber!<CR>
inoremap <silent> <F12> <C-o>:set relativenumber!<CR>
cnoremap <silent> <F12> <C-c>:set relativenumber!<CR>


" Toggle list of special chars
noremap <silent> <F3> :set list!<CR>
inoremap <silent> <F3> <C-o>:set list!<CR>
cnoremap <silent> <F3> <C-c>:set list!<CR>

" Maps \ to the same behavior of ` because of pt_BR keyboard
nnoremap \ `
nnoremap \\ ``

" Insert new line after openning parenthesis, brackets or braces
imap <c-c> <CR><Esc>O

" Escape in normal mode
inoremap jj <Esc>

""" }

""" NerdTRee {

let NERDTreeHijackNetrw=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDShutUp=1

map <silent> <F4> :NERDTreeToggle<Cr>
noremap <leader>n :NERDTreeFind<Cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" }

""" FixWhitespace {
map <silent> <F6> :FixWhitespace<Cr>
vmap <silent> <F6> :FixWhitespace<Cr>

""" }

""" ctrlp.vim {

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \ }
let g:ctrlp_show_hidden = 1

""" }

""" silver searcher {

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --smart-case

    let g:ctrlp_user_command = 'ag %s -l --nocolor --smart-case -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" bind K to grep word under cursor
nnoremap <leader>K :execute 'grep! "\b"'.expand("<cword>").'"\b"'<CR>:rightb<SPACE>cw<CR>

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" bind ,<SPACE> to grep shortcut
nnoremap <leader><SPACE> :Ag<SPACE>

""" }

""" utilsnips + supertab + youcompleteme {
  " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""" }

""" tern {

" tern shortucts
nnoremap <silent> <leader>td :TernDef<CR>
nnoremap <silent> <leader>tpd :TernDefPreview<CR>
nnoremap <silent> <leader>tsd :TernDefSplit<CR>
nnoremap <silent> <leader>tD :TernDoc<CR>
nnoremap <silent> <leader>tt :TernType<CR>
nnoremap <silent> <leader>tR :TernRefs<CR>
nnoremap <silent> <leader>tr :TernRename<CR>

""" }


""" syntastic {

function SyntasticToggleAutoLocList()
    if g:syntastic_auto_loc_list == 2
        let g:syntastic_auto_loc_list = 1
    else
        lclose
        let g:syntastic_auto_loc_list = 2
    endif
    SyntasticCheck
endfunction

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> <leader>lt :call SyntasticToggleAutoLocList()<CR>

" Runs syntastic if the buffer is read due to external changes
autocmd BufRead * SyntasticCheck

" Javascript
let g:syntastic_javascript_checkers = ['eslint']

"""}

""" lighline {

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" function! MyFileformat()
"   return winwidth(0) > 70 ? &fileformat : ''
" endfunction

" function! MyFiletype()
"   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
" endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction
let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
""" }

""" startify {

let g:startify_change_to_dir = 0

""""}

""" signify {

let g:signify_vcs_list              = [ 'git', 'hg' ]
let g:signify_cursorhold_insert     = 1
let g:signify_cursorhold_normal     = 1
let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 1

nnoremap <silent> <leader>gt :SignifyToggle<CR>
nnoremap <silent> <leader>gh :SignifyToggleHighlight<CR>
nnoremap <silent> <leader>gr :SignifyRefresh<CR>
nnoremap <silent> <leader>gD :SignifyDebug<CR>

"" hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

"" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

""" }

""" vim better javascript completion {

let g:vimjs#casesensistive = 0
let g:vimjs#smartcomplete = 1

""" }

""" indentline {

" Vim
let g:indentLine_color_term = 236

"GVim
let g:indentLine_color_gui = '#333333'

""" }

""" gruvbox {

let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_improved_warnings = 1

""" }

""" vim-javascript {

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

""" }

""" vim-easy-align {
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
  \ ':': { 'pattern': ':', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 }
\}
""" }

""" vim-devicons {


let g:webdevicons_enable = 1
let g:DevIconsEnableFolderPatternMatching = 1

""" }

""" incsearch {

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch

" let g:incsearch#auto_nohlsearch = 1

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map z/ <Plug>(incsearch-fuzzy-/)
map z<space> z/
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

""" }

""" camel case motion {

call camelcasemotion#CreateMotionMappings('<leader>')

""" }

""" Javascript libraries syntax {

let g:used_javascript_libs = 'underscore,jquery,angularjs'

""" }

""" vim-json {

let g:vim_json_syntax_conceal = 0

""" }

""" vim-expand-region {

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

""" }

""" vim-argwrap {

nnoremap <silent> <leader>a :ArgWrap<CR>

""" }
