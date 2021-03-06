" Make vim use zsh since I'm testing fish.
" set shell=/bin/zsh

execute pathogen#infect()

filetype plugin indent on

" Basic settings {{{

syntax on

set vb t_vb=
set mouse=a

set fileformats=unix,dos
set fileformat=unix

set wildmode=list:longest,full
set wildignore=*.png,*.jpg,*.jpeg,*.gif,*.swp,*.swo,*/sites/*/files/**,.git,*.tar

set hidden

set colorcolumn=80

" }}}

" Layout settings {{{

set list

set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=2

set ignorecase

set number
set mousehide
set cul
set complete-=b
set complete-=u
set complete-=w
set completeopt-=preview
exec "set path=.,," . getcwd() . "/**"
set textwidth=80

set background=dark
colorscheme molokai

" }}}

" Folding settings {{{

set foldenable
set foldmethod=syntax
set foldlevel=99
set foldcolumn=0

" }}}

" Keybind settings {{{

let mapleader=","
let maplocalleader=","

inoremap jk <esc>
" cnoremap jk <esc>

" Train self to avoid <Esc> key.
inoremap <esc> <nop>
" cnoremap <esc> <nop>

nnoremap j gj
nnoremap k gk
" Hard mode
" nnoremap h <Nop>
" nnoremap j <Nop>
" nnoremap k <Nop>
" nnoremap l <Nop>

map Y y$

nnoremap <Leader>cd :cd $HOME/Sites<CR>:cd 
nnoremap <Leader>cp :cd $HOME/Projects<CR>:cd 

" A bit annoying.
nnoremap q: <Nop>

" Load session
nmap <Leader>ls :so $HOME/.vim/session.vim<CR>

nnoremap <Leader>sp :sp <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>ee :e <C-R>=expand('%:p:h') . '/'<CR>

nnoremap <Leader>eg :e $MYGVIMRC<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>

" }}}

" Autocommand settings {{{

autocmd VimLeave * mks! ~/.vim/session.vim

" }}}

" Plugin settings {{{

  " Powerline {{{

  " let g:Powerline_symbols='fancy'

  " }}}

  " Syntastic {{{

  let g:syntastic_auto_loc_list=1
  let g:syntastic_php_checkers=['php']
  " let g:syntastic_php_checkers=['php', 'phpcs']
  let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme --report=csv"
  let g:syntastic_quiet_warnings=1
  let g:syntastic_mode_map = { 'mode': 'active',
        \ 'active_filetypes': ['ruby', 'php'],
        \ 'passive_filetypes': [] }

  " Sometimes, I don't follow standards. :D
  nnoremap <Leader>st :SyntasticToggleMode<CR>

  " }}}

  " Ack {{{

  " let g:ackprg="ack -H --nocolor --nogroup --column"
  let g:ackprg="ag --nogroup --nocolor --column"
  nnoremap <Leader>ag :Ack! 

  " }}}

  " Tagbar {{{

  nnoremap <Leader>t :TagbarToggle<CR>

  " }}}

  " Tabularize {{{

  nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
  vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>az: :Tabularize /:\zs<CR>
  vmap <Leader>az: :Tabularize /:\zs<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>

  " Format the text as 4 fields with <Space> as the delimiter.
  " :Tabularize /\s*\$\w*\s*

  " }}}

  " CtrlP {{{

  let g:ctrlp_working_path_mode=''
  let g:ctrlp_follow_symlinks=1

  " Ignore *.png, *.gif, *.jpg, and *.jpeg files.
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files | grep -v "\.\(png\|gif|jp\(e\)\?g\)\$"']

  " }}}

  " Indent Guides {{{

  let g:indent_guides_guide_size=1
  let g:indent_guides_enable_on_startup=0
  let g:indent_guides_auto_colors=1

  " }}}

  " NERDTree {{{

  nnoremap <Leader>n :NERDTreeToggle<CR>

  " }}}

" }}}

" Sessions {{{

set sessionoptions-=options
set sessionoptions-=buffers
set sessionoptions-=help
set sessionoptions-=blank

" }}}

" Drupal helpers {{{

inoremap <Leader>fn <C-R>=expand("%:t:r:r")<CR>
nnoremap <Leader>fn "=expand("%:t:r:r")<CR>p

" }}}

" Hilights {{{

hi Normal ctermbg=NONE

" }}}

" vim: foldmethod=marker
