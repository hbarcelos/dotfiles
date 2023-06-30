if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

""" General {

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'djoshea/vim-autoread'
" Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vader.vim'
Plug 'nanotee/zoxide.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""" }

""" Interface {

Plug 'dense-analysis/ale'
" Plug '~/labs/ale'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-dispatch'
Plug 'brooth/far.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'Yilin-Yang/vim-markbar'
Plug 'dsummersl/gundo.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'janko/vim-test'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'nelstrom/vim-visual-star-search'
" Plug 'vim-scripts/colorsupport.vim'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" vim-devicons MUST be included AFTER nerdtree-git-plugin
" to avoid icons being misaligned when git markers are present
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'evandotpro/nerdtree-chmod'

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}

""" }

""" Editing {

" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/vim-metarepeat'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
" Plug 'ervandew/supertab'
Plug 'LutfiLokman/supertab'
Plug 'LunarWatcher/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'chaoren/vim-wordmotion'
Plug 'junegunn/vim-easy-align'
Plug 'PeterRincker/vim-argumentative'
Plug 'FooSoft/vim-argwrap'
Plug 'tommcdo/vim-exchange'
Plug 'terryma/vim-expand-region'
Plug 'mattn/emmet-vim'

" Custom operators
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'glts/vim-textobj-comment'
Plug 'justinj/vim-textobj-reactprop'
Plug 'osyo-manga/vim-textobj-blockwise'

" LSP and autocomplete
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-emmet.vim'
Plug 'prabirshrestha/asyncomplete-necosyntax.vim'
Plug 'andreypopp/asyncomplete-ale.vim'
Plug 'laixintao/asyncomplete-gitcommit'
Plug 'prabirshrestha/asyncomplete-emoji.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
" Plug '~/labs/vim-snippets'
" Plug 'epilande/vim-es2015-snippets'
" Plug 'hbarcelos/vim-react-snippets'
" Plug 'honza/vim-snippets'
" Plug 'ahmedelgabri/vim-ava-snippets'

""" }

""" Syntax {

" Plug 'tpope/vim-git'
" Plug 'tpope/vim-markdown'
" Plug 'othree/html5.vim'
" Plug 'hashivim/vim-terraform'
" Plug 'dag/vim2hs'
" Plug 'fatih/vim-go' ", { 'do': ':GoUpdateBinaries' }
" Plug 'hail2u/vim-css3-syntax'
" Plug 'stephenway/postcss.vim', { 'for': ['scss'] }
" Plug 'cespare/vim-toml'

""" vim-polyglot {

Plug 'sheerun/vim-polyglot'

let g:polyglot_disabled = ['javascript', 'typescript', 'solidity']
" let g:polyglot_disabled = ['javascript', 'typescript']

" Solidity
" Plug 'tomlion/vim-solidity'
Plug 'thesis/vim-solidity'
" Plug 'TovarishFin/vim-solidity'
" TS/JS support {

" Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'neoclide/vim-jsx-improve'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" " Plug 'posva/vim-vue', { 'for' : ['vue'] }

" Plug 'elzr/vim-json'

" Template strings
Plug 'Quramy/vim-js-pretty-template'

" Node.js
Plug 'moll/vim-node'

""" Javascript + Typescript
" Plug 'jason0x43/vim-js-indent'
" }

""" }

" Markdown
Plug 'mzlogin/vim-markdown-toc'

" HTML
Plug 'alvan/vim-closetag'
" Plug 'hbarcelos/vim-closetag'

" Haskell
Plug 'eagletmt/neco-ghc'

" CSS
Plug 'ap/vim-css-color'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Python
Plug 'vim-scripts/indentpython.vim'

" SVG
Plug 'jasonshell/vim-svg-indent'

" Themes
" Plug 'nanotech/jellybeans.vim'
" Plug 'morhetz/gruvbox'
" To install the NORD theme in Gnome Terminal, run:
" curl -s https://raw.githubusercontent.com/arcticicestudio/nord-gnome-terminal/develop/src/nord.sh | bash -
" Plug 'arcticicestudio/nord-vim'
" Plug '~/labs/polar-ice-vim', { 'do': './setup.sh' }
Plug 'hbarcelos/polar-ice-vim', { 'do': './setup.sh' }
" Plug '~/labs/gui-font-size.vim'
Plug 'hbarcelos/gui-font-size.vim'

Plug 'rickhowe/diffchar.vim'

" For fun
Plug 'johngrib/vim-game-code-break'

""" }

Plug 'fladson/vim-kitty'

call plug#end()

""" General {
syntax on

" Set maxmempattern to 5000 instead of the default 1000
set maxmempattern=5000

" Allow local .vimrc
set exrc
set secure

""" GUI only {

set guifont=Hasklug\ Nerd\ Font\ Mono\ Medium\ 12
" Hide menu bar
set guioptions -=m
" Hide scrollbars
set guioptions -=r
set guioptions -=L
" Hide toolbar
set guioptions -=T

""" }

" change the mapleader from \ to ,
let mapleader=','

set formatoptions+=or
" set keymap=accents

set undofile
set undodir=~/.tmp

" Show line numbers
set number

" opening a new file when the current buffer has unsaved
" changes causes fileto be hidden instead of closed
set hidden

" always set autoindenting on
set autoindent
filetype plugin indent on

" copy the previous indentation on autoindenting
set copyindent
set preserveindent
set smarttab
set shiftround
" a tab occupy the size of 4 spaces
set tabstop=4
set softtabstop=2
" number of spaces to use for autoindenting
set shiftwidth=2
set expandtab

" Folding
" set foldmethod=manual
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

augroup remember_folds
  autocmd! * <buffer>
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" Wild menu conf
set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Incremental search (while typing)
set incsearch
" Ignore case on search
set ignorecase
" If the search string contains capitalized letters, so it's case sensitive
set smartcase
set fileformats=unix,dos,mac

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
set matchtime=2

" set list
set listchars=eol:$,tab:>-,lead:·,trail:~,extends:>,precedes:<

"Recursively set the path of the project.
set path=$PWD/**

" Set utf8 as standard encoding
set encoding=utf-8

" Not show current line for each minimized file
set winminwidth=0

" Abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" Better Unix / Windows compatibility
set viewoptions=folds,options,cursor,unix,slash

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Enables current line highlight
set cursorline

" Automatically quit Vim if quickfix window is the last
augroup QuitIfQuickfixIsLast
  autocmd! * <buffer>
  au BufEnter * call MyLastWindow()
augroup END


augroup SpellCheck
    autocmd! * <buffer
    autocmd FileType markdown setlocal spell
    autocmd FileType gitcommit setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype == 'quickfix'
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction
""" }

" Creates a command to edit .vimrc
command! Vimrc :e $MYVIMRC

""" Custom mappings {

" Moves between panels
noremap <c-h> <c-w><c-h>
noremap <c-l> <c-w><c-l>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>

" Open tag
" nnoremap <C-O> <C-]>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap W! w !sudo tee % >/dev/null

" Converts DOS-style EOL (\r\n) do Unix-style (\n)
nnoremap <silent> <leader><leader>u :%s/<C-V><cr>//ge<cr>

" Moves for wrapped lines
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
vnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
vnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" Moves for line boundaries
nnoremap gh ^
nnoremap gl $
vnoremap gh ^
vnoremap gl $

" Emacs/Shell like shortcuts for insert and command/ex mode

" <C-a>: move to head.
inoremap <C-a> <C-o>^
cnoremap <C-a> <Home>
" <C-e>: move to end.
inoremap <C-e> <C-o>$
cnoremap <C-e> <End>
" <C-k>: delete to the end.
cnoremap <expr> <C-k>
      \ repeat("\<Del>", strchars(getcmdline()[getcmdpos() - 1:]))

" Clipboard copy and paste
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>d "+d
nnoremap <leader>D "+D
nnoremap <leader>c "+c
nnoremap <leader>C "+C

vnoremap <leader>y "+y
vnoremap <leader>Y "+Y
vnoremap <leader>p "+p
vnoremap <leader>P "+P
vnoremap <leader>d "+d
vnoremap <leader>D "+D
vnoremap <leader>c "+c
vnoremap <leader>C "+C

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
vnoremap <leader>gs <Esc>:%s/<c-r>=GetVisual()<cr>//g<left><left>
nnoremap <leader>gs :%s/\<<C-r><C-w>\>//g<left><left>

" Bring the 2nd MRU buffer to screen
nnoremap <silent> <tab> :e #<CR>

" Cycle through open buffers with g,Tab and g,Shift+Tab
nnoremap <silent> g<tab> :bn<CR>
nnoremap <silent> g<s-tab> :bp<CR>

" Toggle list of special chars
noremap <silent> <F3> :set list!<CR>
inoremap <silent> <F3> <C-o>:set list!<CR>
cnoremap <silent> <F3> <C-c>:set list!<CR>

" Toggle line numbers
noremap <silent> <F10> :set number!<CR>
inoremap <silent> <F10> <C-o>:set number!<CR>
cnoremap <silent> <F10> <C-c>:set number!<CR>

" Toggle line wrapping
noremap <silent> <F12> :set wrap!<CR>
inoremap <silent> <F12> <C-o>:set wrap!<CR>
cnoremap <silent> <F12> <C-c>:set wrap!<CR>

" Maps \ to the same behavior of ` because it's easier to type on en-US
" keyboards
nnoremap \ `
nnoremap \\ ``

" Escape in normal mode
inoremap jj <Esc>

" Close every window in the current tabview but the current one
nnoremap <leader>o <c-w>o

" Copies absolute path of current file to clipboard
nnoremap <leader><leader>ap :let @+ = expand("%:p")<CR>
" Copies relative path of current file to clipboard
nnoremap <leader><leader>rp :let @+ = expand("%")<CR>

" Replaces all non-digit characters from the current line
nnoremap <leader><leader>D :s/\D//g<CR>
""" }

" Shift+Insert pastes text from the clipboard in command mode
cnoremap <S-Insert> <C-R>+

""" NERDTree {

" Show files matching .gitignore
augroup NERDTreeConfig
  autocmd! * <buffer>
  autocmd FileType nerdtree setlocal nolist
augroup END

" if winwidth(0) >= 150
"   let g:NERDTreeWinSize=41 " original + 10
" endif

let NERDTreeHijackNetrw=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDShutUp=1
let g:NERDTreeGitStatusShowIgnored = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  : '✎',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✎',
    \ 'Clean'     : '✔︎',
    \ 'Ignored'   : '☒',
    \ 'Unknown'   : '?'
    \ }

noremap <silent> <F4> :NERDTreeToggle<Cr>
noremap <leader>n :NERDTreeFind<Cr>

function! s:CloseIfOnlyControlWinLeft()
  if winnr('$') != 1
    return
  endif
  if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction

augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

""" }

""" vim-devicons {

let g:webdevicons_enable = 1

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" the amount of space to use after the glyph character (default ' ')
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
" let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.babelrc'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.prettierrc'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.eslintrc'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.editorconfig'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['yarn.lock'] = '󰈡'
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package-lock.json'] = '󰈡'
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.dapprc'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['robots.txt'] = '󰚩'  " nf-md-history

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['graphql'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tex'] = ''  " nf-md-stop_circle_outline
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cs'] = '󰌛'  " nf-md-language_csharp
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = '󰟔'  " nf-md-language_r
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rproj'] = '󰗆'  " nf-md-vector_rectangle
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sol'] = '󰡪'  " nf-md-ethereum
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pem'] = '󰌋'  " nf-md-key_variant

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\..*ignore$'] = ''

augroup NERDTree
  autocmd!
  autocmd FileType nerdtree setlocal signcolumn=no
augroup END

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

" let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/.snippets/UltiSnips"]

""" }

augroup js_ts_highlight
  autocmd! * <buffer>
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
augroup END

augroup vim_js_pretty_template
  autocmd! * <buffer>
  autocmd FileType typescript JsPreTmpl
  " For leafgarland/typescript-vim users only. Please see #1 for details.
  autocmd FileType typescript syn clear foldBraces
augroup END

""" ALE {

let g:ale_linters = {
  \  'javascript': ['prettier', 'eslint', 'prettier-eslint'],
  \  'javascriptreact': ['prettier', 'eslint', 'prettier-eslint'],
  \  'typescript': ['prettier', 'eslint', 'prettier-eslint', 'tsserver'],
  \  'typescriptreact': ['prettier', 'eslint', 'prettier-eslint', 'tsserver'],
  \  'vue': ['prettier', 'eslint', 'prettier-eslint'],
  \  'json': ['jq', 'jsonlint'],
  \  'jsonc': ['jq', 'jsonlint'],
  \  'css': ['stylelint'],
  \  'scss': ['stylelint'],
  \  'less': ['stylelint'],
  \  'xml': ['xmllint'],
  \  'solidity': ['solhint', 'solium'],
  \  'python': ['flake8', 'pylint'],
  \  'html': ['prettier'],
  \  'svg': ['prettier'],
  \  'c': ['clang'],
  \  'cpp': ['clang++', 'g++'],
  \  'vim': ['vint'],
\ }

let g:ale_fixers = {
  \  'javascript': ['prettier', 'eslint', 'prettier-eslint'],
  \  'typescript': ['prettier', 'eslint', 'prettier-eslint'],
  \  'javascriptreact': ['prettier', 'eslint', 'prettier-eslint'],
  \  'typescriptreact': ['prettier', 'eslint', 'prettier-eslint'],
  \  'vue': ['prettier', 'eslint', 'prettier-eslint'],
  \  'json': ['jq', 'prettier'],
  \  'jsonc': ['jq', 'prettier'],
  \  'css': ['prettier', 'stylelint'],
  \  'scss': ['prettier', 'stylelint'],
  \  'less': ['prettier', 'stylelint'],
  \  'xml': ['prettier', 'xmllint'],
  \  'solidity': ['prettier'],
  \  'toml': ['prettier'],
  \  'python': ['autopep8', 'yapf'],
  \  'html': ['prettier'],
  \  'svg': ['prettier'],
  \  'markdown': ['prettier'],
  \  'sh': ['shfmt'],
  \  'bash': ['shfmt'],
  \  'zsh': ['shfmt'],
  \  'c': ['clang-format'],
  \  'cpp': ['clang-format'],
\}

let g:ale_c_clang_options = '-Wall -O2 -std=c99'
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++17'

" Using the signs bellow because they are not glitchy with Kitty + Vim
" let g:ale_sign_error = '🚨'
" let g:ale_sign_warning = '💡'
" highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
" highlight clear ALEWarningSign " otherwise uses warning bg color (typically yellow)
"
let g:ale_sign_error = "\uf00d"
let g:ale_sign_warning = "\uf071"

augroup ALEHighlightFix
  autocmd! * <buffer>
  autocmd VimEnter * :highlight! ALEErrorSign ctermfg=9 guifg=#F59597
  autocmd VimEnter * :highlight! ALEWarningSign ctermfg=11 guifg=#F2DB94
  autocmd VimEnter * :highlight! ALEError ctermfg=9 guifg=#F59597
  autocmd VimEnter * :highlight! ALEWarning ctermfg=11 guifg=#F2DB94
augroup END

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 0

nnoremap <silent> <leader>lf :ALEFix<CR>

nmap <silent> <leader>j <Plug>(ale_next_wrap)
nmap <silent> <leader>k <Plug>(ale_previous_wrap)

""" }

""" lighline {
" \ 'colorscheme': 'nord',

let g:lightline = {
      \ 'colorscheme': 'PolarIce',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'linter_checking' ,'linter_errors', 'linter_warnings', 'linter_infos' , 'linter_ok', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \ },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' }
      \ }

" let g:lightline#ale#indicator_checking = '🕛...'
" let g:lightline#ale#indicator_infos = 'ℹ️I:'
" let g:lightline#ale#indicator_warnings = '💡W:'
" let g:lightline#ale#indicator_errors = '🚨E:'
" let g:lightline#ale#indicator_ok = '✅Ok'

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129:"
let g:lightline#ale#indicator_warnings = "\uf071:"
let g:lightline#ale#indicator_errors = "\uf00d:"
let g:lightline#ale#indicator_ok = "\uf00c OK"

function! LightLineModified()
  return &filetype =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &filetype !~? 'help' && &readonly ? "\uf023" : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &filetype == 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype == 'unite' ? unite#get_status_string() :
        \ &filetype == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &filetype !~? 'vimfiler'
      let mark = "\uf126 "  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : "\uf15b no ft") : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &filetype == 'unite' ? 'Unite' :
        \ &filetype == 'vimfiler' ? 'VimFiler' :
        \ &filetype == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_regex')
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

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_change_to_dir = 0
let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

""" }

""" signify {
augroup SignifyColors
  autocmd! * <buffer>
  autocmd VimEnter * :highlight! SignColumn ctermbg=none
augroup END

nnoremap <silent> <leader>gST :SignifyToggle<CR>
nnoremap <silent> <leader>gSH :SignifyToggleHighlight<CR>
nnoremap <silent> <leader>gSR :SignifyRefresh<CR>
nnoremap <silent> <leader>gSD :SignifyDebug<CR>

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

let g:nord_cursor_line_number_background = 1
let g:nord_italic_comments = 1

"""}

" Makes the background transparent. Leave these out if you're not using a transparent terminal.
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE

" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
" newer than 0.1.4.
set termguicolors

" Setting dark mode
set background=dark

" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

" Change the color scheme here.
try
  " colorscheme nord
  colorscheme PolarIce
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
\ '>': {
\     'pattern': '>>\|=>\|>'
\   },
\ ';': {
\     'pattern':         ';\+',
\     'delimiter_align': 'l',
\     'left_margin':     0,
\     'right_margin':    1,
\   },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment']
\   },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }

""" }

""" incsearch {

" incsearch.vim x fuzzy x vim-easymotion
map <Leader> <Plug>(easymotion-prefix)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<C-e>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(deepcopy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {
  \     "\<C-e>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0,
  \   'is_stay': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/  incsearch#go(<SID>config_easyfuzzymotion({}))
noremap <silent><expr> z?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> gz/ incsearch#go(<SID>config_easyfuzzymotion({ 'is_stay': 1 }))

nmap <Space> /
nmap z<Space> z/

set hlsearch
" Remove search highlight
noremap <silent> <Leader>. :nohlsearch<CR>

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

let g:incsearch#auto_nohlsearch = 1

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

""" }

""" FAR {
let g:far#enable_undo=1

let g:far#glob_mode='rg'
""" }

""" grep {

let g:ctrlp_use_caching = 0
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
      \ }

if executable('rg')
  set grepprg=rg\ --line-number\ --no-heading\ --no-messages\ --smart-case\ --hidden\ --iglob\ '!.{git,svn,hg}/'

  let g:ctrlp_user_command = 'rg %s --files --color=never --ignore-case --smart-case --hidden --iglob "!.{git,svn,hg}/" --glob ""'

  " bind K to grep word under cursor
  nnoremap <leader>K :execute 'grep! "\b"'.expand("<cword>").'"\b"'<CR>:rightb<SPACE>cw<CR><CR>

  """ FAR {
  let g:far#source = 'rg'
  let g:far#ignore_files+=['.gitignore']
  """ }

elseif executable('ag')
" if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --smart-case

  let g:ctrlp_user_command = 'ag %s -l --nocolor --smart-case --hidden --ignore ".git" -g ""'

  " bind K to grep word under cursor
  nnoremap <leader>K :execute 'grep! "\b"'.expand("<cword>").'"\b"'<CR>:rightb<SPACE>cw<CR><CR>

  """ FAR {
  let g:far#source = 'ag'
  """ }
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_use_caching = 1
endif

command! -nargs=+ -complete=file -bar Grep silent! grep! <args>|copen|redraw!
nnoremap <leader><Space> :Grep<SPACE>

""" }

""" camel case motion {

" call camelcasemotion#CreateMotionMappings('<leader>')

" map <silent> ]v <Plug>CamelCaseMotion_w
" map <silent> [v <Plug>CamelCaseMotion_b
" map <silent> ]V <Plug>CamelCaseMotion_e
" map <silent> [V <Plug>CamelCaseMotion_ge

" omap <silent> iv <Plug>CamelCaseMotion_ie
" xmap <silent> iv <Plug>CamelCaseMotion_ie
" omap <silent> av <Plug>CamelCaseMotion_iw
" xmap <silent> av <Plug>CamelCaseMotion_iw
" omap <silent> agv <Plug>CamelCaseMotion_ib
" xmap <silent> agv <Plug>CamelCaseMotion_ib

""" }

""" vim-wordmotion {

let g:wordmotion_mappings = {
	\ 'w' : '',
	\ 'W' : '',
	\ 'b' : '',
	\ 'B' : '',
	\ 'e' : '',
	\ 'E' : '',
	\ 'ge' : '',
	\ 'gE' : '',
	\ 'aw' : '',
	\ 'aW' : '',
	\ 'iw' : '',
	\ 'iW' : '',
	\ '<C-R><C-W>' : '',
	\ '<C-R><C-A>' : '',
\ }

nnoremap ]v <Plug>WordMotion_w
onoremap ]v <Plug>WordMotion_w
xnoremap ]v <Plug>WordMotion_w

nnoremap [v <Plug>WordMotion_b
onoremap [v <Plug>WordMotion_b
xnoremap [v <Plug>WordMotion_b

nnoremap ]gv <Plug>WordMotion_e
onoremap ]gv <Plug>WordMotion_e
xnoremap ]gv <Plug>WordMotion_e

nnoremap [gv <Plug>WordMotion_ge
onoremap [gv <Plug>WordMotion_ge
xnoremap [gv <Plug>WordMotion_ge

nnoremap ]V <Plug>WordMotion_W
onoremap ]V <Plug>WordMotion_W
xnoremap ]V <Plug>WordMotion_W

nnoremap [V <Plug>WordMotion_B
onoremap [V <Plug>WordMotion_B
xnoremap [V <Plug>WordMotion_B

nnoremap ]gV <Plug>WordMotion_E
onoremap ]gV <Plug>WordMotion_E
xnoremap ]gV <Plug>WordMotion_E

nnoremap [gV <Plug>WordMotion_gE
onoremap [gV <Plug>WordMotion_gE
xnoremap [gV <Plug>WordMotion_gE

onoremap av <Plug>WordMotion_aw
xnoremap av <Plug>WordMotion_aw

onoremap iv <Plug>WordMotion_iw
xnoremap iv <Plug>WordMotion_iw

onoremap aV <Plug>WordMotion_aW
xnoremap aV <Plug>WordMotion_aW

onoremap iV <Plug>WordMotion_iW
xnoremap iV <Plug>WordMotion_iW

cmap <C-R><C-V> <Plug>WordMotion_<C-R><C-W>
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

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'solidity']

""" }

""" mzlogin/vim-markdown-toc {

" Use - as the marker for list items
let g:vmt_list_item_char = '-'

" Indent by 2 spaces
let g:vmt_list_indent_text = '  '

""" }

" """ vimux {

" " Prompt for a command to run
" nnoremap <silent> <Leader>vp :VimuxPromptCommand<CR>

" " Run last command executed by VimuxRunCommand
" nnoremap <silent> <Leader>vl :VimuxRunLastCommand<CR>

" " Inspect runner pane
" nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>

" " Zoom the tmux runner pane
" nnoremap <silent> <Leader>vz :VimuxZoomRunner<CR>

" " Interrupt the tmux runner
" nnoremap <silent> <Leader>vc :VimuxInterruptRunner<CR>

" " Interrupt the tmux runner
" nnoremap <silent> <Leader>vk :VimuxCloseRunner<CR>

" " Open a tmux runner
" nnoremap <silent> <leader>vo :call VimuxOpenRunner()<CR>

" let g:VimuxOrientation = 'h'

" function! CustomVimuxSetWindowMode()
"   let g:VimuxUseNearest = 0
"   let g:VimuxRunnerType = 'window'
" endfunction

" function! CustomVimuxSetPaneMode()
"   let g:VimuxUseNearest = 1
"   let g:VimuxRunnerType = 'pane'
" endfunction

" function! CloseOnExit()
"   if g:VimuxRunnerType == 'window' && g:VimuxUseNearest == 0
"     VimuxCloseRunner
"   endif
" endfunction

" call CustomVimuxSetPaneMode()

" " closes the runner automatically when closing vim
" augroup vimux
"   autocmd! * <buffer>

"   autocmd VimLeave * :call CloseOnExit()
" augroup END

" """ }

""" Custom file types {
augroup custom_filetypes
  autocmd! * <buffer>

  autocmd BufNewFile,BufRead .babelrc,.stylelintrc,.eslintrc,.jshintrc,.prettierrc,.postcssrc setlocal filetype=json

  autocmd BufNewFile,BufRead *.flow setlocal filetype=javascript

  autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx

  autocmd BufNewFile,BufRead .dapprc,.sethrc, setlocal filetype=bash
augroup END
""" }

""" vim-test {

let test#javascript#jest#file_pattern = '\.test\.\(js\|jsx\)$'
" let test#javascript#mocha#file_pattern = '\.test\.(js|jsx|ts|tsx)'
" let test#javascript#ava#executable = 'yarn test'
let test#javascript#jest#executable = 'yarn test'
" let test#javascript#mocha#executable = 'yarn test'

let test#strategy = 'kitty'
let test#javascript#jest#options = '--color=always'

" nnoremap <silent> <leader>te :TestFile
" nnoremap <silent> <leader>tt :TestFile<CR>
" nnoremap <silent> <leader>tw :TestFile --watch<CR>
" nnoremap <silent> <leader>ts :TestSuite<CR>
" nnoremap <silent> <leader>tl :TestLast<CR>
" nnoremap <silent> <leader>tv :TestVisit<CR>
""" }

""" bufexplorer {

" Show unlisted buffers.
let g:bufExplorerShowUnlisted=0

" Show relative paths.
let g:bufExplorerShowRelativePath=1

""" }

""" auto-pairs {

" let g:AutoPairsFlyMode = 1
" let g:AutoPairsShortcutToggle = '<leader><leader>pt'
let g:AutoPairsCompatibleMaps = 0

let g:AutoPairsMapBS = 1
let g:AutoPairsBSAfter = 1
let g:AutoPairsMultilineClose = 1
let g:AutoPairsMultilineBackspace = 1

let g:AutoPairsShortcutToggle               = '<C-g><C-t>'
let g:AutoPairsShortcutFastWrap             = '<C-g><C-f>'
let g:AutoPairsShortcutJump                 = '<C-g><C-n>'
let g:AutoPairsShortcutBackInsert           = '<C-g><C-b>'
let g:AutoPairsShortcutToggleMultilineClose = '<C-g><C-m>'
let g:AutoPairsShortcutIgnore               = '<C-g><C-e>'
let g:AutoPairsMoveExpression               = '<C-g>%key'

let g:AutoPairs = autopairs#AutoPairsDefine([
  \ {'open': '**', 'close': '**', 'filetype': 'markdown'},
  \ {'open': '<!--', 'close': '-->', 'filetype': 'markdown', 'multiline': 1},
\ ])

""" }

""" vim-bbye {

nnoremap <Leader>q :Bwipeout<CR>
nnoremap <Leader>Q :Bwipeout!<CR>

""" }

""" vim-jsx {

let g:jsx_ext_required = 0

""" }

""" vim-dispatch {

let g:dispatch_no_maps = 1

""" }

""" vim-closetag {

let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.vue,*.xhml,*.xml'

" Disables auto-close if not in a valid region (based on filetype)
"
let g:closetag_regions = {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ 'typescriptreact': 'jsxRegion,tsxRegion',
  \ 'javascriptreact': 'jsxRegion',
  \ }

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"""}

""" emmet-vim {
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}
""" }

""" vim-styled-components {

augroup FixStyledComponentsHighlight
  autocmd! * <buffer>
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
augroup END


function! s:SCAddSnips() abort
  if search('styled-components', 'nw') != 0
    UltiSnipsAddFiletypes css
  endif
endfunction

augroup UseCSSSnippetsForJSX
  autocmd! * <buffer>
  autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx call s:SCAddSnips()
augroup END

""" }

""" eslint {

function! EslintProject(...) abort
  let l:additional_args = join(a:000, ' ')

  if executable('yarn')
    let cmd = 'yarn run --silent eslint . --ext .js,.jsx,.ts,.tsx,.vue --no-color -f compact ' . l:additional_args
  elseif executable('npm')
    let cmd = 'npm run --silent eslint . --ext .js,.jsx,.ts,.tsx,.vue --no-color -f compact' . l:additional_args
  else
    echoerr 'No ESLint found'
  endif

  " Allows using eslint --format compact output with quickfix list
  let efm = '%f: line %l\, col %c\, %trror - %m'
  let efm ..= ',%f: line %l\, col %c\, %tarning - ''%*[^'']'' %m'
  " Is lines which don't match the format
  let efm ..= ',%-G%.%#'

  sil let qfl = getqflist({'lines': systemlist(cmd), 'efm': efm})
  call setqflist(get(qfl, 'items', []))
  cw
  redraw!
endfunction

command! -nargs=* -bar EslintProject call EslintProject(<f-args>)

nnoremap <leader>lP :EslintProject<CR>
nnoremap <leader>lF :EslintProject --fix<CR>

""" }

""" Yilin-Yang/vim-markbar {
nmap <Leader>m <Plug>ToggleMarkbar
""" }

""" junegunn/vim-peakaboo {
let g:peekaboo_delay = 500
""" }

""" justinj/vim-textobj-reactprop {
call textobj#user#plugin('reactprop', {
  \   '-': {
  \     '*sfile*': expand('<sfile>:p'),
  \     'select-a-function': 's:ReactPropA',
  \     'select-a': 'aR',
  \     'select-i-function': 's:ReactPropI',
  \     'select-i': 'iR',
  \   },
  \ })
""" }

""" thinca/vim-textobj-between {
" let g:textobj_between_no_default_key_mappings = 1

" omap aF	<Plug>(textobj-between-a)
" xmap aF	<Plug>(textobj-between-a)
" omap iF	<Plug>(textobj-between-i)
" xmap iF	<Plug>(textobj-between-i)

" call textobj#user#plugin('prefix', {
"   \   'path_a': {
"   \     'select': 'a/',
"   \     'pattern': '\(\<\([^/]\)\+/\)\|\(/[^/]\+\>\)\|\(\.\{1,2}/\)',
"   \     'scan': 'cursor',
"   \   },
"   \   'path_i': {
"   \     'select': 'i/',
"   \     'pattern': '\(/\zs[^/]\+\ze\(/\|\>\)\)\|\(\(/\|\<\)\zs[^/]\+\ze\/\)\|\(\.\{1,2}\ze/\)',
"   \     'scan': 'cursor',
"   \   },
"   \   'prop_a': {
"   \     'select': 'a.',
"   \     'pattern': '\(\_s*\<\([^.]\)\+\_s*\.\)\|\(\.\_s*[^.]\+\>\_s*\)',
"   \     'scan': 'line',
"   \   },
"   \   'prop_i': {
"   \     'select': 'i.',
"   \     'pattern': '\(\.\zs\_s*[^.]\+\ze\_s*\(\.\|\>\)\)\|\(\(\.\|\<\)\zs\_s*[^.]\+\ze\_s*\.\)',
"   \     'scan': 'line',
"   \   },
"   \ })

""" AndrewRadev/dsf.vim {
" let g:dsf_no_mappings = 1

" nmap dsf <Plug>DsfDelete
" nmap csf <Plug>DsfChange

" nmap dsnf <Plug>DsfNextDelete
" nmap csnf <Plug>DsfNextChange

" omap af <Plug>DsfTextObjectA
" xmap af <Plug>DsfTextObjectA
" omap if <Plug>DsfTextObjectI
" xmap if <Plug>DsfTextObjectI
""" }

""" diffchar.vim {
let g:DiffUnit = 'Char'
let g:DiffColors = 1
let g:DiffPairVisible = 1
nmap <silent> <leader><leader>d <Plug>ToggleDiffCharAllLines
"""}

""" Custom text objects {

" let g:surround_{char2nr("d")} = "\"\r\""
" nmap dsd <Plug>Dsurround"
" nmap csd <Plug>Csurround"
" onoremap ad a"
" xnoremap ad a"
" onoremap id i"
" xnoremap id i"

" let g:surround_{char2nr("s")} = "'\r'"
" nmap dss <Plug>Dsurround'
" nmap css <Plug>Csurround'
" onoremap as a'
" xnoremap as a'
" onoremap is i'
" xnoremap is i'

" let g:surround_{char2nr("a")} = "`\r`"
" nmap dsa <Plug>Dsurround`
" nmap csa <Plug>Csurround`
" onoremap aa a`
" xnoremap aa a`
" onoremap ia i`
" xnoremap ia i`

""" }

""" vim-kitty=navigator {
let g:kitty_navigator_installation_path='./vim-kitty-navigator'
""" }

""" vim-sandwich {
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" " Use vim-surround keymaps
" runtime macros/sandwich/keymap/surround.vim

" Text objects to select a text surrounded by brackets or user-specified characters
xmap is <Plug>(textobj-sandwich-query-i)
xmap as <Plug>(textobj-sandwich-query-a)
omap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)

" Text objects to select the nearest surrounded text automatically
xmap iss <Plug>(textobj-sandwich-auto-i)
xmap ass <Plug>(textobj-sandwich-auto-a)
omap iss <Plug>(textobj-sandwich-auto-i)
omap ass <Plug>(textobj-sandwich-auto-a)

" Text objects to select a text surrounded by user-specified characters
xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)

" Shortcut text objects for different quote types
omap id isd
omap ad asd
xmap id isd
xmap ad asd

omap iq isq
omap aq asq
xmap iq isq
xmap aq asq

omap ig isg
omap ag asg
xmap ig isg
xmap ag asg

" Restore b as )
nmap sdb sd)
nmap srb sr)
xmap ib i)
omap ib i)
xmap ab a)
omap ab a)

" Make r as ] (squaRe bracket)
xmap ir i]
omap ir i]
xmap ar a]
omap ar a]

" Add sandwich for the entire line
onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> sass <Plug>(sandwich-add)<SID>line

" Rethink auto-delete and auto-replace
nmap sds <Plug>(sandwich-delete-auto)
nmap srs <Plug>(sandwich-replace-auto)

" Use d (Double-quote) for ", q (Quote) for ' and g (Grave accent) for `
" Use vim-surround convention of adding spaces to {,( and [ surroundings
" Use insert mode for surround with function
" Add Markdown specific surround
let g:sandwich#recipes += [
  \   {'buns': ['"', '"'], 'quoteescape': 1, 'input': ['d']},
  \   {'buns': ["'", "'"], 'quoteescape': 1, 'input': ['q']},
  \   {'buns': ['`', '`'], 'quoteescape': 1, 'input': ['g']},
  \   {'buns': ['{', '}'], 'nesting': 1, 'skip_break': 1, 'input': ['{', '}', 'B']},
  \   {'buns': ['[', ']'], 'nesting': 1, 'input': ['[', ']', 'r']},
  \   {'buns': ['(', ')'], 'nesting': 1, 'input': ['(', ')', 'b']},
  \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
  \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
  \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
  \   {'buns': ['{\s*', '\s*}'],   'regex': 1, 'nesting': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
  \   {'buns': ['\[\s*', '\s*\]'], 'regex': 1, 'nesting': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
  \   {'buns': ['(\s*', '\s*)'],   'regex': 1, 'nesting': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
  \   {'buns': ['(', ')'], 'cursor': 'head', 'command': ['startinsert'], 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['f']},
  \   {
  \     'buns':       ['```', '```'],
  \     'cursor':     'headend',
  \     'nesting':    0,
  \     'linewise':   1,
  \     'skip_break': 1,
  \     'kind':       ['add', 'replace'],
  \     'action':     ['add'],
  \     'filetype':   ['markdown'],
  \     'input':      ['G'],
  \   },
  \   {
  \     'buns':       ['```\w*\s*', '```'],
  \     'motionwise': ['line'],
  \     'regex':      1,
  \     'nesting':    0,
  \     'linewise':   1,
  \     'skip_break': 1,
  \     'kind':       ['delete', 'replace', 'textobj'],
  \     'action':     ['delete'],
  \     'filetype':   ['markdown'],
  \     'input':      ['G'],
  \   },
  \   {
  \     'buns':    ['[', ']()'],
  \     'nesting': 0,
  \     'cursor':  'tail',
  \     'command': ['startinsert'],
  \     'kind':    ['add', 'replace'],
  \     'action':  ['add'],
  \     'input':   ['l']
  \   },
  \   {
  \     'buns':     ['\[', '\]\(([^)]*)\|\[\d\+\]\)'],
  \     'regex':    1,
  \     'nesting':  0,
  \     'kind':     ['delete', 'replace', 'textobj'],
  \     'action':   ['delete'],
  \     'filetype': ['markdown'],
  \     'input':    ['l'],
  \   },
  \   {
  \     'buns':    ['![', ']()'],
  \     'nesting': 0,
  \     'cursor':  'tail',
  \     'command': ['startinsert'],
  \     'kind':    ['add', 'replace'],
  \     'action':  ['add'],
  \     'input':   ['I']
  \   },
  \   {
  \     'buns':     ['!\[', '\]\(([^)]*)\|\[\d\+\]\)'],
  \     'regex':    1,
  \     'nesting':  0,
  \     'kind':     ['delete', 'replace', 'textobj'],
  \     'action':   ['delete'],
  \     'filetype': ['markdown'],
  \     'input':    ['I'],
  \   },
  \ ]

" Make f match `obj.method(|)` as well as `func(|)`
let g:sandwich#magicchar#f#patterns = [
  \   {
  \     'header' : '\<\%(\h\k*\.\)*\h\k*',
  \     'bra'    : '(',
  \     'ket'    : ')',
  \     'footer' : '',
  \   },
  \ ]

""" }

""" vim-lsp {

" let g:lsp_diagnostics_enabled = 0

""" }

""" asyncomplete {

set omnifunc=lsp#complete

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" asyncomplete and UltiSnips compatibility, with the help of supertab {

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0
let g:SuperTabClosePreviewOnPopupClose = 1

let g:UltiSnipsExpandTrigger = '<C-e>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" }

imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
imap <c-@> <Plug>(asyncomplete_force_refresh)

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview

augroup asyncomplete_autoclose
  autocmd! * <buffer>
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
    \ 'name': 'emmet',
    \ 'whitelist': ['html'],
    \ 'completor': function('asyncomplete#sources#emmet#completor'),
    \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'gitcommit',
    \ 'whitelist': ['gitcommit'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#gitcommit#completor')
    \ })

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
    \ 'name': 'emoji',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#emoji#completor'),
    \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['c', 'cpp', 'html'],
    \ 'completor': function('asyncomplete#sources#omni#completor'),
    \ 'config': {
    \   'show_source_kind': 1,
    \ },
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
    \ 'name': 'necosyntax',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))
""" }
