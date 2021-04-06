call plug#begin('~/.vim/plugged')

""" General {

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'djoshea/vim-autoread'
" Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vader.vim'

""" }

""" Interface {

" Plug 'dense-analysis/ale'
Plug '~/labs/ale'
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'brooth/far.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'Yilin-Yang/vim-markbar'
Plug 'tpope/vim-fugitive'
Plug 'dsummersl/gundo.vim'
Plug 'ctrlpvim/ctrlp.vim'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !git submodule update --init --recursive && GOFLAGS=-modcacherw python3 install.py --go-completer --ts-completer
  endif
endfunction
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

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
Plug 'vim-scripts/colorsupport.vim'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" vim-devicons MUST be included AFTER nerdtree-git-plugin
" to avoid icons being misaligned when git markers are present
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'evandotpro/nerdtree-chmod'

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

""" }

""" Editing {

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/vim-metarepeat'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'ervandew/supertab'
" Plug 'raimondi/delimitmate'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'bkad/CamelCaseMotion'
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
Plug 'kana/vim-textobj-function'
Plug 'glts/vim-textobj-comment'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'justinj/vim-textobj-reactprop'
Plug 'lucapette/vim-textobj-underscore'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'thinca/vim-textobj-between'
Plug 'Julian/vim-textobj-variable-segment'
" Must come after Julian/vim-textobj-variable-segment
Plug 'vimtaku/vim-textobj-keyvalue'

" Snippets
Plug 'SirVer/ultisnips'
Plug '~/labs/vim-snippets'
" Plug 'epilande/vim-es2015-snippets'
" Plug 'hbarcelos/vim-react-snippets'
" Plug 'honza/vim-snippets'
" Plug 'ahmedelgabri/vim-ava-snippets'

""" }

""" Syntax {

" Plug 'tpope/vim-git'
" Plug 'tpope/vim-markdown'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'chemzqm/vim-jsx-improve'

"function! InstallFlow(info)
"  if a:info.status == 'installed' || a:info.force
"    !npm install -g flow-bin
"  endif
"endfunction
"Plug 'flowtype/vim-flow', { 'do': function('InstallFlow') }

Plug 'posva/vim-vue', { 'for' : ['vue'] }
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'Quramy/vim-js-pretty-template'
" Plug 'othree/html5.vim'
" Plug 'hashivim/vim-terraform'
" Plug 'dag/vim2hs'
" Plug 'fatih/vim-go' ", { 'do': ':GoUpdateBinaries' }
" Plug 'hail2u/vim-css3-syntax'
" Plug 'stephenway/postcss.vim', { 'for': ['scss'] }
" Plug 'cespare/vim-toml'

""" vim-polyglot {

" let g:polyglot_disabled = ['solidity']
let g:polyglot_disabled = ['javascript', 'typescript']

""" }

Plug 'sheerun/vim-polyglot'

" Git
Plug 'vim-scripts/gitignore'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"function! BuildTern(info)
"  if a:info.status == 'installed' || a:info.force
"    !npm install
"  endif
"endfunction
"
" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'typescript', 'flow.javascript', 'vue'], 'do': function('BuildTern') }
"
" Node.js
Plug 'moll/vim-node'

" Javascript + Typescript
Plug 'jason0x43/vim-js-indent'

" HTML
Plug 'alvan/vim-closetag'

" Haskell
Plug 'eagletmt/neco-ghc'

" CSS
Plug 'ap/vim-css-color'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Solidity
" Plug 'thesis/vim-solidity'

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
" Plug 'hbarcelos/polar-ice-vim', { 'do': './setup.sh' }
Plug '~/labs/polar-ice-vim', { 'do': './setup.sh' }

" For fun
Plug 'johngrib/vim-game-code-break'

""" }

call plug#end()

""" General {
syntax on

""" GUI only {
set guifont=Hasklig\ Medium\ 11
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

set undofile
set undodir=~/.tmp

" Show line numbers
set number

" Lines larger than the screen size don't wrap
set nowrap

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
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"Recursively set the path of the project.
set path=$PWD/**

" Set utf8 as standard encoding
set encoding=UTF-8

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

function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype == "quickfix"
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
cnoremap w!! w !sudo tee % >/dev/null

" Converts DOS-style EOL (\r\n) do Unix-style (\n)
nnoremap <silent> <leader><leader>u :%s/<C-V><cr>//ge<cr>

" Moves for wrapped lines
" nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Moves for line boundaries
nnoremap gh ^
nnoremap gl $
vnoremap gh ^
vnoremap gl $

" Emacs like shortcuts in insert mode
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

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

" Maps \ to the same behavior of ` because it's simpler to type
nnoremap \ `
nnoremap \\ ``

" Escape in normal mode
inoremap jj <Esc>

" Close every window in the current tabview but the current one
nnoremap <leader>o <c-w>o

" Copies absolute path of current file to clipboard
nnoremap <silent> <leader><leader>p :let @+ = expand("%:p")<CR>
" Copies relative path of current file to clipboard
nnoremap <silent> <leader><leader>rp :let @+ = expand("%")<CR>

""" }

""" NERDTree {

" Show files matching .gitignore
augroup NERDTreeConfig
  autocmd! * <buffer>
  autocmd FileType nerdtree setlocal nolist
augroup END

if winwidth(0) >= 150
  let g:NERDTreeWinSize=41 " original + 10
endif

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
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
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

""" utilsnips + supertab + youcompleteme {

" YouCompleteMe and UltiSnips compatibility, with the help of supertab

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0
let g:SuperTabClosePreviewOnPopupClose = 1

let g:UltiSnipsExpandTrigger = '<C-c>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

nnoremap <leader>gr :YcmCompleter RefactorRename <C-R><C-W>
nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gT :YcmCompleter GetType<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <silent> <leader>gD :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>gR :YcmCompleter GoToReferences<CR>
nnoremap <silent> <leader>gi :YcmCompleter OrganizeImports<CR>
nnoremap <silent> <leader>gD :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>gI :YcmCompleter GoToImplementation<CR>
nnoremap <silent> <leader>gh <plug>(YCMHover)

set regexpengine=1
let g:ycm_auto_hover = 0
let g:ycm_filepath_blacklist = {}
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_error_symbol = "\uf00d"
let g:ycm_warning_symbol = "\uf071"

augroup YcmHighlightFix
  autocmd! * <buffer>
  autocmd VimEnter * :highlight! YcmErrorSign ctermfg=9 guifg=#F59597
  autocmd VimEnter * :highlight! YcmWarningSign ctermfg=11 guifg=#F2DB94
  autocmd VimEnter * :highlight! YcmErrorSection ctermfg=9 guifg=#F59597
  autocmd VimEnter * :highlight! YcmWarningSection ctermfg=11 guifg=#F2DB94
augroup END

 " https://github.com/ycm-core/YouCompleteMe/issues/3601#issuecomment-585445618
 " Milliseconds - tweak to liking
 let s:debounce = 250

 " --------
 "  Below here is evil. You should not read, use or otherwise acknowledge
 "  its existence.
 "
 "  YOU HAVE BEEN WARNED.
 " --------

 let g:ycm_auto_trigger = 0

 " Find the SID of autoload/youcompleteme.vim
 function! s:FindYouCompleteMeInternal()
   let scripts = split( execute( 'scriptnames' ), '\n' )
   for line in scripts
     let match = matchlist( line,
                          \ '\m\v^\s*(\d+): \f+autoload\/youcompleteme.vim$' )

     if len( match ) > 0 && match[ 0 ] !=# ''
       return match[ 1 ]
     endif
   endfo

   return -1
 endfunction

 let s:youcompleteme_internal = -1
 let s:timer = 0

 function! s:CallYCMInt( f )
   if s:youcompleteme_internal < 0
     return
   endif

   exe "call \<SNR>" . s:youcompleteme_internal . '_' . a:f
 endfunction

 function! s:TriggerUserDefinedCompletion( ... )
   call s:CallYCMInt( 'Complete()' )
   call s:CallYCMInt( 'RequestCompletion()' )
   call s:CallYCMInt( 'UpdateSignatureHelp()' )
   call s:CallYCMInt( 'RequestSignatureHelp()' )
 endfunction

 let s:looked = 0

 function! s:LookForYCMInt( ... )
   let s:youcompleteme_internal = s:FindYouCompleteMeInternal()
   if s:youcompleteme_internal < 0
     let s:looked += 1
     if s:looked > 10
       " abort
       return
     endif
     call timer_start( 500, funcref( 's:LookForYCMInt' ) )
     return
   endif
   augroup Local
     au InsertCharPre * call s:StartYcmTrigger()
     au InsertLeave * call s:StopYcmTrigger()
   augroup END
 endfunction

 function! s:StartYcmTrigger() abort
   call timer_stop( s:timer )
   let s:timer = timer_start( s:debounce,
                            \ funcref( 's:TriggerUserDefinedCompletion' ) )
 endf

 function! s:StopYcmTrigger() abort
   call timer_stop( s:timer )
 endf

 augroup LocalStartup
   au!
   au VimEnter * call s:LookForYCMInt()
 augroup END

""" }

""" tern {
" augroup tern
"   autocmd!

"   autocmd FileType vue call tern#Enable()
"   autocmd FileType vue setlocal completeopt-=preview

"   autocmd FileType javascript,javascript.jsx,vue let g:tern_map_keys=1
"   autocmd FileType javascript,javascript.jsx,vue let g:tern_show_argument_hints = 'on_hold'
"   autocmd FileType javascript,javascript.jsx,vue nnoremap <silent> <leader>td :TernDef<CR>
"   autocmd FileType javascript,javascript.jsx,vue nnoremap <silent> <leader>tpd :TernDefPreview<CR>
"   autocmd FileType javascript,javascript.jsx,vue nnoremap <silent> <leader>tsd :TernDefSplit<CR>
"   autocmd FileType javascript,javascript.jsx,vue nnoremap <silent> <leader>tD :TernDoc<CR>
"   autocmd FileType javascript,javascript.jsx,vue nnoremap <silent> <leader>tT :TernType<CR>
"   autocmd FileType javascript,javascript.jsx,vue nnoremap <silent> <leader>tR :TernRefs<CR>
"   autocmd FileType javascript,javascript.jsx,vue nnoremap <silent> <leader>tr :TernRename<CR>

" augroup END
""" }

""" tsuquyomi {

" let g:tsuquyomi_disable_default_mappings = 1
" let g:tsuquyomi_disable_quickfix = 1
" let g:tsuquyomi_javascript_support = 1

" augroup tsuquyomi
"   autocmd!

"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue setlocal completeopt-=preview
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue setlocal completeopt+=menu

"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>te  :TsuquyomiAsyncGeterr<CR>
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>td  <plug>(TsuquyomiDefinition)
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>tsd <plug>(TsuquyomiSplitDefinition)
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>tH  :TsuquyomiSignatureHelp<CR>
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>tb  <plug>(TsuquyomiGoBack)
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <buffer> <leader>th  :<C-u>echo tsuquyomi#hint()<CR>
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>tT  <plug>(TsuquyomiTypeDefinition)
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>tR  <plug>(TsuquyomiReferences)
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>ti  <plug>(TsuquyomiImplementation)
"   autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,vue nmap <buffer> <silent> <leader>tr  <plug>(TsuquyomiRenameSymbolCS)
" augroup END
""" }

augroup vim_js_pretty_template
  autocmd! * <buffer>

  autocmd FileType typescript JsPreTmpl
  " For leafgarland/typescript-vim users only. Please see #1 for details.
  autocmd FileType typescript syn clear foldBraces
augroup END

""" ALE {

let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint', 'tsserver'],
\   'vue': ['prettier', 'eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'xml': ['xmllint'],
\   'solidity': ['solhint', 'solium'],
\   'python': ['flake8', 'pylint'],
\   'html': ['prettier'],
\   'svg': ['prettier'],
\   'c': ['clang'],
\   'cpp': ['clang++', 'g++']
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\   'json': ['jq', 'prettier'],
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint'],
\   'xml': ['prettier', 'xmllint'],
\   'solidity': ['prettier'],
\   'python': ['autopep8', 'yapf'],
\   'html': ['prettier'],
\   'svg': ['prettier'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format']
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
"\ 'colorscheme': 'nord',

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

" The "^[" is a single character. You enter it by pressing Ctrl+v and then ESC.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Makes the background transparent. Leave these out if you're not using a transparent terminal.
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE

" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
" newer than 0.1.4.
set termguicolors

" Setting dark mode
set background=dark

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
  \ ':': { 'pattern': ':', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 }
\}
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
  nnoremap <leader>K :execute 'grep! "\b"'.expand("<cword>").'"\b"'<CR>:rightb<SPACE>cw<CR>

  """ FAR {
  let g:far#source = 'rg'
  let g:far#ignore_files+=['.gitignore']
  """ }

elseif executable('ag')
" if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --smart-case

  let g:ctrlp_user_command = 'ag %s -l --nocolor --smart-case --hidden --ignore ".git" -g ""'

  " bind K to grep word under cursor
  nnoremap <leader>K :execute 'grep! "\b"'.expand("<cword>").'"\b"'<CR>:rightb<SPACE>cw<CR>

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
nmap <silent> ]v <Plug>CamelCaseMotion_w
vmap <silent> ]v <Plug>CamelCaseMotion_w
nmap <silent> [v <Plug>CamelCaseMotion_b
vmap <silent> [v <Plug>CamelCaseMotion_b

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

augroup markdown
  autocmd! * <buffer>
  au FileType markdown setl sw=4 sts=4 et
augroup END

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

let g:VimuxOrientation = 'h'

function! CustomVimuxSetWindowMode()
  let g:VimuxUseNearest = 0
  let g:VimuxRunnerType = 'window'
endfunction

function! CustomVimuxSetPaneMode()
  let g:VimuxUseNearest = 1
  let g:VimuxRunnerType = 'pane'
endfunction

function! CloseOnExit()
  if g:VimuxRunnerType == 'window' && g:VimuxUseNearest == 0
    VimuxCloseRunner
  endif
endfunction

call CustomVimuxSetPaneMode()

" closes the runner automatically when closing vim
augroup vimux
  autocmd! * <buffer>

  autocmd VimLeave * :call CloseOnExit()
augroup END

""" }

""" Custom file types {
augroup custom_filetypes
  autocmd! * <buffer>

  autocmd BufNewFile,BufRead .stylelintrc,.eslintrc,.babelrc,.jshintrc,.prettierrc,.postcssrc set syntax=json

  autocmd BufNewFile,BufRead *.flow set filetype=javascript

  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

augroup END
""" }

""" vim-test {
" let test#javascript#ava#file_pattern = '.*'
" let test#javascript#jest#file_pattern = '.*'
" let test#javascript#mocha#file_pattern = '\.test\.(js|jsx|ts|tsx)'
let test#javascript#ava#executable = 'yarn test'
let test#javascript#jest#executable = 'yarn test'
let test#javascript#mocha#executable = 'yarn test'

let test#strategy = 'vimux'

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

""" AutoPairs {

" let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = '<esc>t'

""" }

""" vim-bbye {

nnoremap <Leader>q :Bwipeout<CR>

""" }

""" vim-jsx {

let g:jsx_ext_required = 0

""" }

""" vim-dispatch {

let g:dispatch_no_maps = 1

""" }

""" vim-closetag {

let g:closetag_filetypes = 'html,xhtml,phtml,javascript.jsx,jsx,typescript.tsx,tsx,vue'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,tsx,vue'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_close_shortcut = '<leader>>'

" Disables auto-close if not in a valid region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
"""}

""" emmet-vim {
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
""" }

""" vim-styled-components {

augroup FixStyledComponentsHighlight
  autocmd!
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

""" vimtaku/vim-textobj-keyvalue {
omap aV	<Plug>(textobj-value-a)
xmap aV	<Plug>(textobj-value-a)
omap iV	<Plug>(textobj-value-i)
xmap iV	<Plug>(textobj-value-i)
omap aK	<Plug>(textobj-key-a)
xmap aK	<Plug>(textobj-key-a)
omap iK	<Plug>(textobj-key-i)
xmap iK	<Plug>(textobj-key-i)
"""}
