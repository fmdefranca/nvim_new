call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'Raimondi/delimitMate'

call plug#end()
""""""""""""""""""""""""""""""

" deoplete config
let g:deoplete#enable_at_startup = 1
"" auto close method preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"" use tab to cycle
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" airline theme selector
let g:airline_theme='jellybeans'

" mapping keys
map <Space> <Leader> " remap leader
inoremap jj <Esc> " remap jj to esc insert mode 
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
nmap <c-q> :q<CR>
imap <c-q> <Esc>:q<CR>

" code jumper jedi-vim
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" setup neo make pylinter
let g:neomake_python_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

" highlight yank
hi HighlightedyankRegion cterm=reverse gui=reverse
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" Syntax colour scheme
colorscheme onedark
set background=dark

" Default setups
syntax on
set number
set relativenumber
set cursorline
set list listchars=tab:>\ ,trail:-,eol:¬
set ruler
let python_highlight_all=1
filetype plugin on
filetype indent on
set hlsearch "highlight search results

" Abbreviations
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

" Run python within nvim
nnoremap <buffer> <F9> <ESC>:w<cr> :exec '!python' shellescape(@%, 1)<cr>

" add a ruler line, only highlights letters that go that far
highlight ColorColumn ctermbg=DarkCyan
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%121v', 100)

" adding a comment to test something
