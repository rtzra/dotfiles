" ----------------------------------
" Vim config file
" https://github.com/rtzra/dotfiles
" ----------------------------------

" Automatic installation plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/bundle')
Plug 'gertjanreynaert/cobalt2-vim-theme'  " Color theme
Plug 'vim-airline/vim-airline'            " Status bar
Plug 'vim-airline/vim-airline-themes'     " Themes for status bar
Plug 'ryanoasis/vim-devicons'             " Icons
Plug 'scrooloose/nerdtree'                " Nerd Tree like filemanager
Plug 'preservim/nerdcommenter'            " Easy comments
Plug 'airblade/vim-gitgutter'             " Shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks
Plug 'tpope/vim-fugitive'                 " Git wrapper
Plug 'rbong/vim-flog'                     " Flog is a fast, beautiful, and powerful git branch viewer
Plug 'psliwka/vim-smoothie'               " Smoothe scrolling
Plug 'tpope/vim-surround'                 " Surround selected text with brackets, quotes, tags etc
call plug#end()

" vim-airline settings
let g:airline_powerline_fonts = 1     " Support for Powerline fonts
let g:Powerline_symbols='unicode'     " Unicode support
let g:airline_section_c = '%F'        " Format for section_c
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_statusline_ontop=0       " Status line on top
let g:airline_theme='base16'            " Airline color theme, look at https://github.com/vim-airline/vim-airline/wiki/Screenshots

" NerdTree shortcut and settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:WebDevIconsUnicodeDecorateFolderNodes = 1   " Unicode folder icons (work together with vim-devicons)
let g:NERDTreeFileLines = 1                       " Show line numbers in file
" Close vim if only NERDTree open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ------------------------
" Vim Settings
" ------------------------
colorscheme cobalt2   " Set ColorScheme

set encoding=utf-8    "Use UTF-8 as default
set nocompatible      "Disable Vi backward compatibility
syntax enable         "Syntax highlight on

set guioptions=       "Disable GUI options
"set showtabline=0    "Disable tabs

set number relativenumber   " Show line number and relative numbers

set wrap linebreak nolist   " Wrap string

set textwidth=120   "Max string lenght for wrapping

set hlsearch    " Highlight search text

set incsearch   " Interactive search
set ignorecase  " Ignore case while searching

" TAB settings
set tabstop=2
set softtabstop=2
set shiftwidth=2

set expandtab   " Convert tabs to spaces

set smarttab    " Tab to spaces in new line (look shiftwidth parameter)

" Copy indent on new line
set autoindent
set smartindent

set ttyfast   " Fast scrolling

set so=30     " Cursor in the middle screen while listing

filetype plugin indent on   " Internal plugin for indent

"Enable cursor line highlighting
set cursorline
highlight CursorLine ctermbg=237
autocmd InsertEnter * highlight CursorLine ctermbg=239
autocmd InsertLeave * highlight CursorLine ctermbg=237
highlight CursorColumn ctermbg=237

" F<n> Hotkeys
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>
imap <F3> <Esc>:q!<CR>
map <F3> <Esc>:q!<CR>
imap <F4> <Esc>:wq<CR>
map <F4> <Esc>:wq<CR>
imap <F5> <Esc>:set hlsearch!<CR>
map <F5> <Esc>:set hlsearch!<CR>
imap <F8> <Esc>:set cursorcolumn!<CR>
map <F8> <Esc>:set cursorcolumn!<CR>

" vim-powered terminal in split window, press \t for terminal and Ctrl+d to quit
map <Leader>t :term ++close<cr>
tmap <Leader>t <c-w>:term ++close<cr>
