set shiftwidth=4
set expandtab
set smartindent
set exrc
set guicursor=
set relativenumber
set nu
set hidden
set noerrorbells
set nowrap
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Plugins ---------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
"Plug 'https://github.com/neoclide/coc.nvim.'
Plug 'lervag/vimtex'
Plug 'Konfekt/FastFold'
Plug 'matze/vim-tex-fold'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
"themes
colorscheme gruvbox
set background=dark
let g:airline_theme='angr'
hi Normal guibg=NONE ctermbg=NONE
"leader
let mapleader = " "
"sizing
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

"hehe herezja
noremap ; l
noremap l k
noremap k j
noremap j h


command! -nargs=0 Prettier :CocCommand prettier.formatFile

"moving between the windows
nnoremap <leader>j :wincmd h<CR>
nnoremap <leader>k :wincmd j<CR>
nnoremap <leader>l :wincmd k<CR>
nnoremap <leader>; :wincmd l<CR>
"undotree
nnoremap <leader>u :UndotreeShow<CR>
"nerd tree
nnoremap <leader>n :NERDTreeToggle<bar><bar> :vertical resize 30<CR>
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <leader>ps :Rg<SPACE>

nmap <leader>rn <Plug>(coc-rename)
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' tomake sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <leader>w :set wrap!<CR>

nnoremap <silent>t :call CocAction('doHover')<CR>

"   --------------------------------------------------------

"inoremap \" \""<left>
"inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Telescope ----------------------
nnoremap <leader>f <cmd>Telescope buffers<cr>
nnoremap <leader>g <cmd>Telescope find_files<cr>
nnoremap <leader>h <cmd>Telescope live_grep<cr>
nnoremap <leader>v <cmd>Telescope help_tags<cr>
