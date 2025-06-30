call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree' 
Plug 'dense-analysis/ale'
call plug#end()

" space as leader key
let mapleader=' '

" mouse support
set mouse=a

" colors
set termguicolors
set background=dark
colorscheme sorbet

" shared clipboards 
" Fedora: sudo dnf install vim-X11 wl-clipboard
" Ubuntu: sudo apt install vim-gtk3
" Or use Neovim
set clipboard^=unnamed,unnamedplus

" don't wrap long lines
set nowrap

" Save with ctrl s (also in insert mode and then leave insert mode)
map <C-s> :update<cr>
imap <C-s> <ESC>:update<cr>

" omnicomplate with ctrl+space (C-n is keyword completion)
inoremap <C-Space> <C-x><C-o>

" always show lines above/below
set scrolloff=4

" autosave
set autowrite

" ignore case in search
set ignorecase

" tabs and  spaces
set tabstop=2
set shiftwidth=0
set expandtab

" change window also with tab
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Page up/down
noremap <C-j> <C-d>
noremap <C-down> <C-d>
noremap <C-k> <C-u>
noremap <C-up> <C-u>

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

if !has('nvim')
  " make split less ugly
  set fillchars+=vert:│
endif

" FZF
command! FZFLatest call fzf#run(fzf#wrap({
  \ 'source': 'fd --type f --hidden --exclude .git --exec stat -c "%Y %n" | sort -nr | cut -d" " -f2-',
  \ 'sink': 'e',
  \ 'options': '--preview "bat --style=numbers --color=always {} || cat {}" --prompt "Last Changed> "'
  \ }))
nnoremap <leader><space> :FZFLatest<CR>

" NERDTree
map <Bslash> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "right"

" " abbreviations
iabbrev erb <%%><Left><Left>
" iabbrev ife if err != nil {return err}<CR>

" Linters
set omnifunc=ale#completion#OmniFunc
let g:ale_fix_on_save = 0
let g:ale_linters = {
\   'ruby': [''],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'python': ['ruff', 'ruff_format'],
\   'php': ['php_cs_fixer'],
\   'ruby': [''],
\}
nnoremap <silent> gd <Plug>(ale_go_to_definition)
nnoremap <silent> gr <Plug>(ale_find_references)
nnoremap <silent> K <Plug>(ale_hover)
nnoremap <silent> <leader>r :ALERename<CR>
nnoremap <silent> <leader>f :ALEFix<CR>
