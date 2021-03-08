" ----------------------------------- Encoding settins -----------------------
scriptencoding utf8
set encoding=utf8
" ---------------------------------- General Settings ------------------------
set number      " show number of the line
set smartindent
set autoindent  " keeps the indent on newline
set nowrap      " dont wrap lines if line is too long
set ruler       " display position of cursor
set nobackup    " disable backup file
set noswapfile  " disable swapfile
set undodir=~/.vim/undodir " set undofiles dir
set undofile    " enable undofile (same as swapfile)
set incsearch   " move cursor to highlighted text of research
set cursorline
set nu rnu      " nu => current line nb - rnu =>relative number line
set nohlsearch  " remove highlight after searched
set mouse=a
set scrolloff=10 " while scrolling move down 8 lines
set clipboard=unnamed " use the same clipboard as system
set guicursor=  " cursor stay block in each mode
set hidden      " move to other buffers even if current is not saved
set noshowmode  " dont show in which mode vim is in the status bar
set noshowcmd   " dont show keystrokes on status bar
set splitright  " vertical split on right
set splitbelow  " horizental split down
" don't give |ins-completion-menu| messages.
set shortmess+=c
set signcolumn=yes " always show signcolumns
set modifiable " allow write file even if file is opened in another buffer

" highlight cursor line only on current window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" tabulation
set tabstop=4 softtabstop=4
set shiftwidth=4
set ai

set expandtab
set nocompatible

let mapleader = " "
" remove trailing useless trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" --------------------------------- PLUGIN INSTAL ----------------------------
call plug#begin('~/.vim/plugged')
    Plug 'arcticicestudio/nord-vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'Yggdroot/indentLine'
    Plug 'git@github.com:pangloss/vim-javascript.git'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'preservim/nerdcommenter'
    Plug 'git@github.com:kien/ctrlp.vim.git'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'haya14busa/is.vim'
    Plug 'arzg/vim-colors-xcode'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'preservim/nerdtree'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'cdelledonne/vim-cmake'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'alvan/vim-closetag'
    Plug 'mattn/emmet-vim'
call plug#end()

" -------------------------------PLUGIN SETTINGS -----------------------------
filetype plugin on

" Autocompletion use <C-x><C-o> to show completion
set omnifunc=syntaxcomplete#Complete
let g:omni_sql_no_default_maps = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

" HTML autoclose plugin
let g:closetag_filenames = '*.html, *.xml, *.php, *.js'

" Markdown
set nofoldenable
let g:vim_markdown_toc_autofit = 1
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0

function! NERDTreeToggleInCurDir()
    " If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        exe ":NERDTreeClose"
    else
        if (expand("%:t") != '')
            exe ":NERDTreeFind"
        else
            exe ":NERDTreeToggle"
        endif
    endif
endfunction


let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let NERDTreeShowHidden = 1
let g:NERDSpaceDelims = 1

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

" let g:Powerline_symbols = 'fancy'
" let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='xcodedark'

let g:gitgutter_enabled = 1
let g:gitgutter_max_signs = 500

" display whitespaces, tab char, eol char, etc..
" set list lcs+=tab:>--,trail:·,eol:¬,nbsp:∙,space:·

" -------------------------------- mapping -----------------------------------
" moving lines up and down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
noremap <leader>h :wincmd h<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>u :UndotreeShow<CR>
noremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
noremap <leader>vr :vertical resize 30<CR>
noremap <leader>r+ :vertical resize +5<CR>
noremap <leader>r- :vertical resize -5<CR>

noremap <leader>pt :call NERDTreeToggleInCurDir()<Enter>
noremap <silent> <leader>pv :NERDTreeFind<CR>

" Compile C++
noremap <leader>c :! /usr/local/bin/g++-10 %  -DCMAKE_CXX_FLAGS="-Wall -Wextra -Wconversion -Wsign-conversion -pedantic" -o %:r.out<CR>
noremap <leader>r :! ./%:r.out<CR>

" " Adapting for swiss keyboard
noremap $ {
noremap à }

" omni completion remap to ctrl + space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" -------------------------------- hightlighting-------------------------------
" set t_Co=256
" set background=dark
" hi Comment ctermfg=Green
" hi Visual cterm=reverse

syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme xcodedark
" Always change color of column 80
hi ColorColumn ctermbg=8
set colorcolumn=80
