let mapleader=" "

" au VimEnter * silent! !setxkbmap -option caps:escape
au VimEnter * silent! AsyncRun setxkbmap -option caps:escape
" au VimLeave * silent! !setxkbmap -option escape:caps

" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Fazer o remap do Caps Lock é possivel com o PowerToy,
"   em se pode instalar pela Microsoft Store
"   Ou ainda com o repositorio: https://github.com/susam/uncap

" Para não dar erro no Neovide no Windows descomente essa linha
" let g:python3_host_prog = 'C:\Users\Talison\AppData\Local\Programs\Python\Python39\python.exe'

" O map MAIS IMPORTANTE de todos
nnoremap <Right> <nop>
vnoremap <Right> <nop>
inoremap <Right> <nop>
nnoremap <Left> <nop>
vnoremap <Left> <nop>
inoremap <Left> <nop>
nnoremap <Up> <nop>
vnoremap <Up> <nop>
inoremap <Up> <nop>
nnoremap <Down> <nop>
vnoremap <Down> <nop>
inoremap <Down> <nop>
inoremap jj <Esc>


" -- Plugins -----------------------------------------------------
call plug#begin()

" LSP
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'

" CMP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
"
"Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" ICONES
Plug 'onsails/lspkind-nvim'

" Formatter
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'folke/trouble.nvim'

" Funcoes
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-commentary'
Plug 'numToStr/Comment.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'xiyaowong/telescope-emoji.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'folke/which-key.nvim'
Plug 'neoclide/vim-jsx-improve'
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat' "Prettier
Plug 'michaeljsmith/vim-indent-object'

" Visuais
Plug 'rebelot/kanagawa.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

" Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" Plug 'noib3/nvim-cokeline'

Plug 'lewis6991/gitsigns.nvim'
Plug 'mhinz/vim-startify'
Plug 'p00f/nvim-ts-rainbow'


call plug#end()
" ----------------------------------------------------------------





" --- LUA MODULOS ------------------------------------------------
lua require('maps')
lua require('statusline')
lua require('gitsigns').setup()
lua require('pairs')
lua require('lsp')
lua require('formatter')
lua require('snippets')
lua require('file_explorer')
lua require("which-key").setup()
lua require('Comment').setup()
lua require("mason").setup()
lua require("mason-lspconfig").setup({ automatic_installation = false })
lua require("trouble").setup({ position = "right", width = 70 })
" ----------------------------------------------------------------



" ----- Configurações básicas ------------------------------------
set guifont=Ubuntu\ 12
set laststatus=2
set showcmd
set list
set encoding=UTF-8
set hidden
set number
set relativenumber
set nowrap
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set confirm
set incsearch
set hlsearch
set autoindent
set smarttab
set cindent
set splitright
set undodir=~/.vim/undodir
set undofile
set mouse=a
set nocompatible
" -----------------------------------------------------------------





" ------- Fugitive ------------------------------------------------
nnoremap gss :Git 
nnoremap gst :Gtabedit :<CR>
nnoremap gsc :Git commit<CR>
nnoremap gsp :Git push<CR>
nnoremap gsl :Git log --all --graph --decorate --oneline<CR>
" -----------------------------------------------------------------





" ------- Theme ---------------------------------------------------
syntax on
set termguicolors     " enable true colors support
colorscheme kanagawa
" ----------------------------------------------------------------





" ------ ATALHOS---------------------------------------------------
" Ctrl Tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
map <silent><C-TAB> :exe "tabn ".g:lasttab<cr>
vmap n :norm 
" ----------------------------------------------------------------





" ------ SNIPPETS PRÓPRIOS -------------------------------------------
nnoremap ,html :-1read $HOME/.config/nvim/custom/.skeleton.html<CR>G3kS
nnoremap ,main :-1read $HOME/.config/nvim/custom/.main.c<CR>3jS

function EmojisList()
   tabnew $HOME/.config/nvim/custom/.emojis.txt
endfunction

command -nargs=0 Emoji call EmojisList()


function Text()
    set wrap
    set linebreak
    nmap j gj
    nmap k gk
endfunction

command -nargs=0 Txt call Text()
autocmd FileType text,markdown call Text()
nnoremap ,txt :call Text()<CR>
" -------------------------------------------------------------------





" ------ Plugins---------------------------------------------------
" Emmet = digite `g,,` para aplicar o html inserido
let g:user_emmet_leader_key='g,'

"Undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.', 'scp://.']
au FileType gitcommit let b:EditorConfig_disable = 1
" ----------------------------------------------------------------





" ----- EDITAR O VIMRC DIRETAMENTE -------------------------------
map <F2> :call OpenVimrc()<CR>
"nmap :vimrc :tabnew $MYVIMRC<CR>

function OpenVimrc()
   tabnew $MYVIMRC
endfunction

command -nargs=0 Vimrc call OpenVimrc()
" ----------------------------------------------------------------
