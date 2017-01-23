" Pathogen plugin manager
execute pathogen#infect()
execute pathogen#helptags()

" Enable syntax highlight
syntax on
" Enable filetype plugins
filetype on
" Indentation in a plugin-based way
filetype indent plugin on

" Read files from disk as soon as it changes
set autoread

" set term=xterm-256color
set t_Co=256
set background=dark

try
    colorscheme jellybeans
catch
    colorscheme default
endtry

hi Normal guifg=White guibg=Black

set formatoptions+=or

" Leader key for custom shortcuts
let mapleader = ","

" Edit .vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
" Reload .vimrc file
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" opening a new file when the current buffer has unsaved
" changes causes fileto be hidden instead of closed
set hidden

" Allow backspacing over an indent, line break (end of line)
" or start of an insert
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set history=1000
set undolevels=1000
set undofile
set undodir=~/.tmp
set number          " Mostra o número das linhas
" set ruler			"show the cursor position all the time
" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
" set showcmd " Show partial commands in status line and

" " Broken down into easily includeable segments
" set statusline=%<%f\ " Filename
" set statusline+=%w%h%m%r " Options
" set statusline+=%{fugitive#statusline()} " Git Hotness
" " set statusline+=\ [%{getcwd()}] " Current dir
" " set statusline+=\ [%{&ff}/%Y] " Filetype
" set statusline+=%=%-30.(%{&fileencoding?&fileencoding:&encoding}/%{&ff}/%Y%) " Filetype
" set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set preserveindent
set smarttab
set expandtab
set shiftround
set softtabstop=4
set shiftwidth=4    " number of spaces to use for autoindenting
set tabstop=4       " a tab is 4 spaces
set wrap

" Folding
set foldmethod=manual

" Split pannels conf
set splitbelow
set splitright

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

set scrolloff=10    " start scrolling when cursor is N lines from the top/bottom edge

set showmatch       " set show matching parenthesis
set mat=2           " How many tenths of a second to blink when matching brackets

set mouse=a         " enables mouse

" Wild menu conf
set wildmenu
set wildmode=longest:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set hls             " Destaca a busca
set incsearch       " Busca incremental (enquanto digita)
set ignorecase 		" Ignora maiúsculas e minúsculas na busca
set smartcase	 	" Se a busca contém maiúsuclas, é case senstive
set ffs=unix,dos,mac    " Formato de quebras de linha UNIX

set title               " change the terminal's title
set visualbell          " don't beep
set noerrorbells        " don't beep

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" This order mus be respected {
" Sem compatibilidade com versões antigas
set nocompatible
" Status line conf
set laststatus=1
set noshowmode
set noshowcmd
" }

"Recursively set the path of the project.
set path=$PWD/**

" set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Set utf8 as standard encoding
set encoding=utf8

" Not show current line for each minimized file
set wmw=0

set shortmess+=filmnrxoOtT " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
" set virtualedit=onemore " Allow for cursor beyond last character

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Ctags
set tags=./tags;/,~/.vimtags

" Moves between panels
noremap <c-h> <c-w><c-h>
noremap <c-l> <c-w><c-l>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>

" Remove search highligh
noremap <silent> <Leader>. :nohlsearch<CR>

" Open tag
nnoremap <C-O> <C-]>

" Page buffers
nnoremap <silent> <C-B>n :bn<CR>
nnoremap <silent> <C-B>p :bp<CR>
nnoremap <silent> <C-B>f :bf<CR>
nnoremap <silent> <C-B>l :bl<CR>

" Tabs operations
" map <silent> <F7> :tabprev <CR>
" map <silent> <F8> :tabnext <CR>
map <C-n> :tabnew<Space>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Save and quit shortcuts
" nmap <Leader>ww :w!<CR>
" nmap <Leader>wq :wq!<CR>
" nmap <Leader>wa :wa!<CR>
" nmap <Leader>qq :q!<CR>
" nmap <Leader>qa :qa!<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap W! w !sudo tee > /dev/null %

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Moves for wrapped lines
noremap j gj
noremap k gk

" 0 now goes to the first non-blank character
nnoremap 0 ^

" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

" Search to jump to the line containing the word under the cursor
map ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Clipboard copy and paste
noremap <leader><leader>y "+y
noremap <leader><leader>Y "+Y
noremap <leader><leader>p "+p
noremap <leader><leader>P "+P

" Make Y behaves like C and D
noremap Y y$

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Map search for word to not move cursor
nnoremap * *N
nnoremap # #N

" Map <Space> to / (search)
map <space> /

" Replace text in quotes
nmap <leader>cd ci"
nmap <leader>cs ci'

" Move a line of text using ,+[jk] or ,+[jk] on mac
nmap <Leader>j mz:m+<cr>`z
nmap <Leader>k mz:m-2<cr>`z
vmap <Leader>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <Leader>k :m'<-2<cr>`>my`<mzgv`yo`z

"Plugins

" PIV
" let g:DisableAutoPHPFolding = 1
" let g:PIVAutoClose = 0

" Misc
let g:NERDShutUp=1
let b:match_ignorecase = 1

" SnipMate
let g:snips_author = "Henrique Barcelos <rick.hjpbarcelos@gmail.com>"


" RagTag extension
let g:ragtag_global_maps = 1

" ZenCoding.vim
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" autotag.vim
let s:autotag_vim_version=1

if exists("g:autotag_vim_version_sourced")
    if s:autotag_vim_version == g:autotag_vim_version_sourced
        finish
    endif
endif

" Windows
nnoremap <silent> <leader>lc :lclose<CR>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>

" NerdTree {

" NERDTree mappings
map <silent> <F4> :NERDTreeTabsToggle<CR>
" map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
" map <leader>e :NERDTreeFind<CR>
" nmap <leader>nt :NERDTreeFind<CR>

" let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
" let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" }

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_show_hidden = 1
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" Tabularize {
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
" nmap <Leader>a:: :Tabularize /:\zs<CR>
" vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
" }

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Syntastic {
"let g:syntastic_check_on_open=1

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

" C++11
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_cpp_compiler = 'clang'

" Javascript
let g:syntastic_javascript_checkers = ['eslint']

nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> <leader>lt :call SyntasticToggleAutoLocList()<CR>

" SnipMate para arquivos PHP, PHTML
" autocmd FileType phtml :set ft=php.html
au BufRead,BufNewFile *.phtml set filetype=php.html
autocmd FileType php,phtml :set makeprg=php\ -l\ %
autocmd FileType php,phtml :set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php set keywordprg=pman
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

"}

" { LightLine conf
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
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

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
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
"}


" OMNICppComplete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set tags+=~/.vim/tags/cpp
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


" phpcomplete_extended
let g:phpcomplete_index_composer_command = "composer"

" Vim-markdown config
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" More javascript configuration

au FileType javascript,js setl sw=2 sts=2 et
au BufRead,BufNewFile *.js set filetype=javascript

" set conceallevel=1
set concealcursor=nvic
let g:javascript_conceal=1

" vim-javascript conceal settings.
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_conceal_function = "λ"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "<"
let g:javascript_conceal_prototype = "#"

let g:javascript_plugin_jsdoc = 1

let g:used_javascript_libs = 'underscore,angularjs,jasmine,chai,jquery'

" Tern shortucts
nnoremap <silent> <leader>td :TernDef<CR>
nnoremap <silent> <leader>tpd :TernDefPreview<CR>
nnoremap <silent> <leader>tsd :TernDefSplit<CR>
nnoremap <silent> <leader>tD :TernDoc<CR>
nnoremap <silent> <leader>tt :TernType<CR>
nnoremap <silent> <leader>tr :TernRefs<CR>
nnoremap <silent> <leader>tR :TernRename<CR>

" Tagbar shortcuts
nnoremap <silent> <F8> :TagbarToggle<CR>


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap <leader>K :execute 'grep! --silent "\b"'.expand("<cword>").'"\b"'<CR>:rightb<SPACE>cw<CR>

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" bind ,<SPACE> to grep shortcut
nnoremap <leader><SPACE> :Ag<SPACE>

" Bring the 2nd MRU buffer to screen
nnoremap <silent> <leader>bb :e #<CR>

" Maps \ to the same behavior of ` because of pt_BR keyboard
nnoremap \ `
nnoremap \\ ``

" Signify mappings

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

" Startify options
let g:startify_change_to_dir = 0


" Qars utility helper
" @see http://vimcasts.org/episodes/project-wide-find-and-replace/
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction


" QFEnter {
let g:qfenter_vopen_map = ['<C-v>']
let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_topen_map = ['<C-t>']
" }


" FixMyJS {
let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_rc_path = '$HOME/.eslintrc.js'
nnoremap <silent> <Leader><Leader>l :Fixmyjs<CR>
vnoremap <silent> <Leader><Leader>l :Fixmyjs<CR>
" }

" Editor Config {
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" }
