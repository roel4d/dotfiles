call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
call plug#end()


if has("gui_running")
    set guifont=JetBrainsMonoNFM-Regular:h13

    " set guifont=Fira_Code:h12:cANSI:qDRAFT
    " set guioptions -=T
    " set guioptions-=r  "scrollbar
    " set lines=35 columns=100
endif

" space as leader key
let mapleader=' '

" mouse support
set mouse=a

" colors
set termguicolors
set background=dark
colorscheme sorbet

" shared clipboards
set clipboard^=unnamed,unnamedplus

" don't wrap long lines
set nowrap

" make split less ugly
set fillchars+=vert:│

" Save with ctrl s (also in insert mode and then leave insert mode)
map <C-s> :update<cr>
imap <C-s> <ESC>:update<cr>

" omnicomplate with ctrl+space (C-n is keyword completion)
inoremap <C-Space> <C-x><C-o>

" home/end like in readline
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A

" always show 5 lines above/below
set scrolloff=5

" autosave
set autowrite

" ignore case in search
set ignorecase

" tab is 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" change window also with tab
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" open new splits right (vertical) or below (horizontal)
set splitbelow
set splitright
"map <F4> :vsplit<cr>
"map " :vsplit<cr>

" clear search highlight on enter
nnoremap <CR> :noh<CR>

" highlight selection on yank
au TextYankPost * silent! lua vim.highlight.on_yank()

" cursorline only in normal mode
set cul
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul

" timeout for leader key and command
set timeoutlen=300

" FZF
nnoremap <leader><space> :FZF<CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" " abbreviations
" iabbrev erb <%%><Left><Left>
" iabbrev ife if err != nil {return err}<CR>

" " Baan
" au BufReadPost *.cln set syntax=baan
" autocmd FileType baan setlocal commentstring=\|*\ %s

" Linters
set omnifunc=ale#completion#OmniFunc
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'python': ['ruff', 'ruff_format'],
\   'php': ['php_cs_fixer'],
\}
nnoremap <silent> gd <Plug>(ale_go_to_definition)
nnoremap <silent> gr <Plug>(ale_find_references)
nnoremap <silent> K <Plug>(ale_hover)
nnoremap <silent> <leader>r :ALERename<CR>
nnoremap <silent> <leader>f :ALEFix<CR>
