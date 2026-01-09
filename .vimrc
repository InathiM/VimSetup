" =============================================================================
" VimSetup - A Modern Vim Configuration
" =============================================================================

" =============================================================================
" PLUGIN MANAGER (vim-plug)
" =============================================================================
" Auto-install vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" File Navigation
Plug 'preservim/nerdtree'                   " File tree explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                     " Fuzzy file finder

" Git Integration
Plug 'tpope/vim-fugitive'                   " Git commands in Vim
Plug 'airblade/vim-gitgutter'               " Show git diff in gutter

" Code Editing
Plug 'tpope/vim-surround'                   " Surround text with quotes/brackets
Plug 'tpope/vim-commentary'                 " Easy commenting
Plug 'jiangmiao/auto-pairs'                 " Auto-close brackets/quotes
Plug 'tpope/vim-repeat'                     " Repeat plugin commands with .

" Syntax & Language Support
Plug 'sheerun/vim-polyglot'                 " Language pack for syntax highlighting
Plug 'dense-analysis/ale'                   " Async linting engine

" UI Enhancements
Plug 'vim-airline/vim-airline'              " Status line
Plug 'vim-airline/vim-airline-themes'       " Status line themes
Plug 'morhetz/gruvbox'                      " Color scheme
Plug 'dracula/vim', { 'as': 'dracula' }     " Dracula color scheme
Plug 'joshdick/onedark.vim'                 " OneDark color scheme

" Productivity
Plug 'mbbill/undotree'                      " Visualize undo history
Plug 'christoomey/vim-tmux-navigator'       " Seamless tmux/vim navigation

call plug#end()

" =============================================================================
" GENERAL SETTINGS
" =============================================================================
set nocompatible                " Disable Vi compatibility
filetype plugin indent on       " Enable filetype detection
syntax enable                   " Enable syntax highlighting

" Encoding
set encoding=utf-8              " Set encoding to UTF-8
set fileencoding=utf-8          " File encoding

" UI Configuration
set number                      " Show line numbers
set relativenumber              " Relative line numbers
set cursorline                  " Highlight current line
set showmatch                   " Highlight matching brackets
set showcmd                     " Show command in status line
set showmode                    " Show current mode
set wildmenu                    " Visual autocomplete for commands
set wildmode=longest:full,full  " Command-line completion mode
set laststatus=2                " Always show status line
set ruler                       " Show cursor position
set signcolumn=yes              " Always show sign column
set scrolloff=8                 " Keep 8 lines above/below cursor
set sidescrolloff=8             " Keep 8 columns left/right of cursor
set colorcolumn=80              " Show column guide at 80 chars

" Editing
set backspace=indent,eol,start  " Better backspace behavior
set autoindent                  " Auto-indent new lines
set smartindent                 " Smart auto-indentation
set expandtab                   " Use spaces instead of tabs
set tabstop=4                   " Tab width
set shiftwidth=4                " Indent width
set softtabstop=4               " Soft tab width
set smarttab                    " Smart tab handling
set nowrap                      " Don't wrap lines by default
set linebreak                   " Break lines at word boundaries

" Search
set incsearch                   " Incremental search
set hlsearch                    " Highlight search results
set ignorecase                  " Case-insensitive search
set smartcase                   " Smart case sensitivity

" Performance
set lazyredraw                  " Don't redraw during macros
set updatetime=300              " Faster completion
set timeoutlen=500              " Faster key sequence completion
set ttimeoutlen=10              " Faster escape key response

" Files & Backup
set hidden                      " Allow hidden buffers
set nobackup                    " Don't create backup files
set nowritebackup               " Don't write backup files
set noswapfile                  " Don't create swap files
set autoread                    " Auto-reload changed files
set confirm                     " Confirm before closing unsaved files

" Undo Persistence
set undofile                    " Persistent undo
set undodir=~/.vim/undodir      " Undo directory
set undolevels=1000             " Number of undo levels
set undoreload=10000            " Number of lines to save for undo

" Mouse Support
set mouse=a                     " Enable mouse in all modes
set ttymouse=xterm2             " Mouse type

" Split Behavior
set splitbelow                  " Open horizontal splits below
set splitright                  " Open vertical splits to the right

" Clipboard
set clipboard=unnamedplus       " Use system clipboard

" Bell
set noerrorbells                " Disable error bells
set novisualbell                " Disable visual bell
set belloff=all                 " Turn off all bells

" =============================================================================
" COLOR SCHEME
" =============================================================================
set termguicolors               " Enable true colors
set background=dark             " Dark background

" Set color scheme (uncomment your preference)
silent! colorscheme gruvbox
" silent! colorscheme dracula
" silent! colorscheme onedark

" =============================================================================
" KEY MAPPINGS
" =============================================================================
" Set leader key to space
let mapleader = " "
let maplocalleader = " "

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>Q :qa!<CR>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows with arrows
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Tab navigation
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Quick access to vimrc
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" Better yank to end of line
nnoremap Y y$

" Keep cursor centered when scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Join lines without moving cursor
nnoremap J mzJ`z

" Paste without losing register content
xnoremap <leader>p "_dP

" Delete without copying
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Quick escape from insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" =============================================================================
" PLUGIN CONFIGURATIONS
" =============================================================================

" --- NERDTree ---
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store', '__pycache__', '\.pyc$', 'node_modules']
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen=1

" Close vim if NERDTree is the only window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" --- FZF ---
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <C-p> :Files<CR>

" FZF layout
let g:fzf_layout = { 'down': '~40%' }

" --- vim-fugitive (Git) ---
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log --oneline<CR>
nnoremap <leader>gb :Git blame<CR>

" --- GitGutter ---
let g:gitgutter_enabled = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nnoremap <leader>hp :GitGutterPreviewHunk<CR>
nnoremap <leader>hs :GitGutterStageHunk<CR>
nnoremap <leader>hu :GitGutterUndoHunk<CR>

" --- ALE (Linting) ---
let g:ale_enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap ]e <Plug>(ale_next_wrap)
nmap [e <Plug>(ale_previous_wrap)
nnoremap <leader>af :ALEFix<CR>

" --- Airline ---
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

" --- Undotree ---
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1

" =============================================================================
" AUTOCOMMANDS
" =============================================================================
augroup vimrc_autocommands
  autocmd!

  " Remove trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e

  " Return to last edit position when opening files
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Auto-resize splits when Vim is resized
  autocmd VimResized * wincmd =

  " Highlight yanked text
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END

" =============================================================================
" FILETYPE-SPECIFIC SETTINGS
" =============================================================================
augroup filetype_settings
  autocmd!

  " Web development (2 space indentation)
  autocmd FileType html,css,javascript,typescript,json,yaml,vue,svelte setlocal tabstop=2 shiftwidth=2 softtabstop=2

  " Python
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=88

  " Go (use tabs)
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4

  " Markdown
  autocmd FileType markdown setlocal wrap linebreak spell spelllang=en_us

  " Makefile (use tabs)
  autocmd FileType make setlocal noexpandtab
augroup END

" =============================================================================
" CUSTOM COMMANDS
" =============================================================================
" Create undodir if it doesn't exist
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), 'p')
endif

" Trim trailing whitespace command
command! TrimWhitespace :%s/\s\+$//e

" Quick file reload
command! Reload source $MYVIMRC

" =============================================================================
" END OF CONFIGURATION
" =============================================================================
