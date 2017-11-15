call plug#begin('~/.vim/plugged')

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh --tern-completer
  endif
endfunction

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction

function! InstallEslint(info)
  if a:info.status == 'installed' || a:info.force
    !sudo npm install -g eslint
  endif
endfunction

Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-rsi'
Plug 'dsummersl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'do': function('InstallEslint') }
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern') }
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'PeterRincker/vim-argumentative'
Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-metarepeat'
Plug 'bkad/CamelCaseMotion'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/gitignore'
Plug 'djoshea/vim-autoread'
Plug 'wellle/targets.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'vim-scripts/restore_view.vim'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Javascript
Plug 'pangloss/vim-javascript'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'othree/javascript-libraries-syntax.vim'

" Angular
Plug 'burnettk/vim-angular'

" EJS
Plug 'briancollins/vim-jst'

" RAML
Plug 'in3d/vim-raml'

" HTML
Plug 'alvan/vim-closetag'

" Terraform
Plug 'hashivim/vim-terraform'

" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

" For fun
Plug 'johngrib/vim-game-code-break'

call plug#end()

""" General {
syntax on
filetype plugin indent on

" change the mapleader from \ to ,
let mapleader=","

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

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Wild menu conf
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

""" Custom mappings {

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

" Moves for line boundaries
nnoremap H ^
nnoremap L $

" Emacs like shortcuts in insert mode
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

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

" Close every window in the current tabview but the current one
nnoremap <leader>o <c-w>o

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

""" Gundo {

let g:mundo_right = 1
nnoremap <silent> <F5> :MundoToggle<CR>

""" }

""" FixWhitespace {

map <silent> <F6> :StripWhitespace<Cr>
vmap <silent> <F6> :StripWhitespace<Cr>

""" }

""" ctrlp.vim {

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }
let g:ctrlp_show_hidden = 1

""" }

""" silver searcher {

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --smart-case

    let g:ctrlp_user_command = 'ag %s -l --nocolor --smart-case --hidden -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" bind K to grep word under cursor
nnoremap <leader>K :execute 'grep! "\b"'.expand("<cword>").'"\b"'<CR>:rightb<SPACE>cw<CR>

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" bind ,<SPACE> to grep shortcut
nnoremap <leader><SPACE> :Ag<SPACE>

""" }

""" utilsnips + supertab + youcompleteme {
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Fix Python Path (for YCM)
let g:ycm_path_to_python_interpreter="/usr/bin/python"

""" }

""" tern {

"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'


" tern shortucts
nnoremap <silent> <leader>td :TernDef<CR>
nnoremap <silent> <leader>tpd :TernDefPreview<CR>
nnoremap <silent> <leader>tsd :TernDefSplit<CR>
nnoremap <silent> <leader>tD :TernDoc<CR>
nnoremap <silent> <leader>tt :TernType<CR>
nnoremap <silent> <leader>tR :TernRefs<CR>
nnoremap <silent> <leader>tr :TernRename<CR>

""" }

""" ALE {

let g:ale_linters = {
\   'javascript': ['eslint', 'standard'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint', 'standard'],
\}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '‼️'

nnoremap <silent> <leader>lf :ALEFix<CR>

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

""" }

""" lighline {

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
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
      \   'linter_warnings': 'MyWarnings',
      \   'linter_errors': 'MyErrors',
      \   'linter_ok': 'MyOk'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \ },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyWarnings()
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD\|ControlP' 
        let _ = lightline#ale#warnings()
        return strlen(_) ? _ : ''
    endif
    return ''
endfunction

function! MyErrors()
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD\|ControlP'
        let _ = lightline#ale#errors()
        return strlen(_) ? _ : ''
    endif
    return ''
endfunction

function! MyOk()
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD\|ControlP'
        let _ = lightline#ale#ok()
        return strlen(_) ? _ : ''
    endif
    return ''
endfunction

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

let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_improved_warnings = 1

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

""" vim-markdown {

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']

au FileType markdown setl sw=4 sts=4 et

""" }

""" vimux {

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

" Interrupt the tmux runner
map <Leader>vc :VimuxInterruptRunner<CR>

"""" development utilities {

" javascript

au FileType javascript nnoremap <leader>vt :call VimuxRunCommand("npm run test -- " . bufname("%"))<CR>

au FileType javascript nnoremap <leader>vw :call VimuxRunCommand("npm run test -- " . bufname("%") . " --watch")<CR>

au FileType javascript nnoremap <leader>vr :call VimuxRunCommand("node -- " . bufname("%"))<CR>

"""" }

""" }
