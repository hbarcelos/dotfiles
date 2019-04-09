call plug#begin('~/.vim/plugged')

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !python3 ./install.py
  endif
endfunction

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction

function! InstallEslint(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g eslint
  endif
endfunction

function! InstallFlow(info)
  if a:info.status == 'installed' || a:info.force
    !npm install -g flow-bin
  endif
endfunction

Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'dsummersl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'do': function('InstallEslint') }
Plug 'ternjs/tern_for_vim', { 'do': function('BuildTern') }
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ahmedelgabri/vim-ava-snippets'
Plug 'raimondi/delimitmate'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
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
Plug 'FooSoft/vim-argwrap'
Plug 'vim-scripts/restore_view.vim'
Plug 'janko-m/vim-test'
Plug 'nelstrom/vim-visual-star-search'
Plug 'brooth/far.vim'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-function'
Plug 'glts/vim-textobj-comment'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'justinj/vim-textobj-reactprop'

" Tmux integration
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" Javascript
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'chemzqm/vim-jsx-improve'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'flowtype/vim-flow', { 'do': function('InstallFlow') }

" Angular
Plug 'burnettk/vim-angular'

" EJS
Plug 'briancollins/vim-jst'

" RAML
Plug 'in3d/vim-raml'

" HTML
Plug 'alvan/vim-closetag'

" XML
Plug 'othree/xml.vim'

" Terraform
Plug 'hashivim/vim-terraform'

" Haskell
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'html', 'jsx'] }

" Themes
Plug 'nanotech/jellybeans.vim'
" Plug 'morhetz/gruvbox'
" To install the theme in Gnome Terminal, run:
" curl -s https://raw.githubusercontent.com/arcticicestudio/nord-gnome-terminal/develop/src/nord.sh | bash -
Plug 'arcticicestudio/nord-vim'

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

" set show matching pairs
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"Recursively set the path of the project.
set path=$PWD/**

" Set utf8 as standard encoding
set encoding=UTF-8

" Not show current line for each minimized file
set wmw=0

" Abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" Better Unix / Windows compatibility
set viewoptions=folds,options,cursor,unix,slash

" Turn backup off
set nobackup
set nowb
set noswapfile

" Enables current line highlight
set cursorline

" Automatically quit Vim if quickfix window is the last
au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction
""" }

""" Custom mappings {

" Moves between panels
noremap <c-h> <c-w><c-h>
noremap <c-l> <c-w><c-l>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>

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

" quickly select pasted text
noremap gV `[v`]

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - https://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vnoremap <leader>s <Esc>:%s/<c-r>=GetVisual()<cr>/
vnoremap <leader>gs <Esc>:%s/<c-r>=GetVisual()<cr>//g<left><left>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>gs :%s/\<<C-r><C-w>\>//g<left><left>

" Bring the 2nd MRU buffer to screen
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
let g:NERDTreeWinSize=41 " original + 10

noremap <silent> <F4> :NERDTreeToggle<Cr>
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
imap <silent> <S-F6> <c-o>:StripWhitespace<Cr>

""" }

""" ctrlp.vim {

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }
let g:ctrlp_show_hidden = 1

""" }

""" ultisnips {

let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/my-snippets/UltiSnips"]

""" }

""" utilsnips + supertab + youcompleteme {

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0

let g:UltiSnipsExpandTrigger = "<c-c>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Fix Python Path (for YCM)
let g:ycm_path_to_python_interpreter = "/usr/bin/python"

""" }

""" tern {

"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints = 'on_hold'


" tern shortucts
nnoremap <silent> <leader>td :TernDef<CR>
nnoremap <silent> <leader>tpd :TernDefPreview<CR>
nnoremap <silent> <leader>tsd :TernDefSplit<CR>
nnoremap <silent> <leader>tD :TernDoc<CR>
nnoremap <silent> <leader>tT :TernType<CR>
nnoremap <silent> <leader>tR :TernRefs<CR>
nnoremap <silent> <leader>tr :TernRename<CR>

""" }

""" ALE {

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'xml': ['xmllint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'json': ['jq'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'xml': ['xmllint'],
\}

let g:ale_sign_error = '‼️'
let g:ale_sign_warning = '⚠️'
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

nnoremap <silent> <leader>lf :ALEFix<CR>

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

""" }

""" lighline {

let g:lightline = {
      \ 'colorscheme': 'nord',
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

function! IsNotPluginWindow()
    return expand('%:t') !~? 'Tagbar\|Gundo\|__Mundo\|NERD\|ControlP'
endfunction

function! MyWarnings()
    if IsNotPluginWindow()
        let _ = lightline#ale#warnings()
        return strlen(_) ? _ : ''
    endif
    return ''
endfunction

function! MyErrors()
    if IsNotPluginWindow()
        let _ = lightline#ale#errors()
        return strlen(_) ? _ : ''
    endif
    return ''
endfunction

function! MyOk()
    if IsNotPluginWindow()
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

""" }

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
omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)

""" }

""" vim better javascript completion {

let g:vimjs#casesensistive = 0
let g:vimjs#smartcomplete = 1

""" }

""" gruvbox {

let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_improved_warnings = 1

""" }

""" Nord {

let g:nord_comment_brightness = 10
let g:nord_cursor_line_number_background = 1
let g:nord_italic_comments = 1

"""}

" The "^[" is a single character. You enter it by pressing Ctrl+v and then ESC.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Makes the background transparent. Leave these out if you're not using a transparent
" terminal.
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
" newer than 0.1.4.
set termguicolors

" Setting dark mode
" set background=dark

" Change the color scheme here.
try
  colorscheme nord
catch
  colorscheme default
endtry

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

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable custom folder/directory glyph exact matching
" (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" enable folder/directory glyph flag (disabled by default with 0)
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

""" }

""" incsearch {

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


set hlsearch

" Remove search highligh
noremap <silent> <Leader>. :nohlsearch<CR>

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

nnoremap <Space> /

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
nnoremap <leader><Space> :Ag<SPACE>

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
nnoremap <silent> <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
nnoremap <silent> <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane
nnoremap <silent> <Leader>vz :VimuxZoomRunner<CR>

" Interrupt the tmux runner
nnoremap <silent> <Leader>vc :VimuxInterruptRunner<CR>

" Interrupt the tmux runner
nnoremap <silent> <Leader>vk :VimuxCloseRunner<CR>

" Open a tmux runner
nnoremap <silent> <leader>vo :call VimuxOpenRunner()<CR>

let g:VimuxOrientation = "h"

function! CustomVimuxSetWindowMode()
  let g:VimuxUseNearest = 0
  let g:VimuxRunnerType = "window"
endfunction

function! CustomVimuxSetPaneMode()
  let g:VimuxUseNearest = 1
  let g:VimuxRunnerType = "pane"
endfunction

function! CloseOnExit()
  if g:VimuxRunnerType == 'window' && g:VimuxUseNearest == 0
    VimuxCloseRunner
  endif
endfunction

call CustomVimuxSetWindowMode()

" closes the runner automatically when closing vim
autocmd VimLeave * :call CloseOnExit()

""" }

""" Custom file types {
autocmd BufNewFile,BufRead *stylelintrc,*eslintrc,*babelrc,*jshintrc set syntax=json
autocmd BufNewFile,BufRead *stylelintrc,*eslintrc,*babelrc,*jshintrc set filetype=json

autocmd BufNewFile,BufRead *.flow set filetype=javascript

autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
""" }

""" vim-test {
let test#javascript#ava#file_pattern = '\.test\.js'
let test#javascript#jest#file_pattern = '\.test\.js'
let test#strategy = "vimux"

nnoremap <silent> <leader>te :TestFile
nnoremap <silent> <leader>tt :TestFile<CR>
nnoremap <silent> <leader>tw :TestFile --watch<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>
""" }

""" FAR {
let g:far#source = 'ag'
""" }

""" bufexplorer {

" Show unlisted buffers.
let g:bufExplorerShowUnlisted=0

" Show relative paths.
let g:bufExplorerShowRelativePath=1

""" }

""" AutoPairs {

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = '<esc>t'

""" }

""" vim-bbye {

nnoremap <Leader>q :Bwipeout<CR>

""" }

""" vim-jsx {

let g:jsx_ext_required = 0

""" }
