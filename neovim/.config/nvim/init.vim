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


"Plugins
call plug#begin()

" Funcoes
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'editorconfig/editorconfig-vim'

" Visuais
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/vim-cursorword'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()



" LUA MODULOS
lua require('maps')
lua require('statusline')


" ----- EDITAR O VIMRC DIRETAMENTE -------------------------------
map <F2> :call OpenVimrc()<CR>
"nmap :vimrc :tabnew $MYVIMRC<CR>

function OpenVimrc()
   tabnew $MYVIMRC
endfunction

command -nargs=0 Vimrc call OpenVimrc()
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
" -----------------------------------------------------------------


" ------- Fugitive ------------------------------------------------
nnoremap gss :Git
nnoremap gst :Git<CR>
nnoremap gsc :Git commit<CR>
" -----------------------------------------------------------------




" ------- Theme ---------------------------------------------------
syntax on
set termguicolors     " enable true colors support
" let ayucolor="mirage" " for mirage version of theme
colorscheme onedark

" Tempo para destacar a palavra em cima
let g:cursorword_delay = 1000
" ----------------------------------------------------------------



" ------Coc EXTENSÕES --------------------------------------------
" EXTENSÕES
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-css', 'coc-vetur', 'coc-html', 'coc-explorer', 'coc-snippets', 'coc-prettier', 'coc-clangd' ]

" Atalhos
inoremap <silent><expr> <c-space> coc#refresh()
" Seta TAB para escolher as sugestões que aparecerem
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nnoremap <silent><C-z> :CocCommand explorer --preset floating<CR>
nnoremap <Leader>ed :CocCommand explorer --preset .vim<CR>
nnoremap <Leader>ef :CocCommand explorer --preset floating<CR>
nnoremap <Leader>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <Leader>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <Leader>el :CocList explPresets
" ----------------------------------------------------------------




" ------ fzf ---------------------------------------------------
nnoremap <C-p> :Files<CR>

" Em um repositorio Git fazer uma pesquisa ignorando os arquivos no .gitignore
autocmd User Fugitive call RepositorioGit()
function RepositorioGit()
    nnoremap <C-p> :GFiles<CR>
endfunction

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" ----------------------------------------------------------------




" ------ ATALHOS---------------------------------------------------
" Apagar hightlight na pesquisa com /
" Ctrl Tab
au TabLeave * let g:lasttab = tabpagenr()
map <silent> <C-TAB> :exe "tabn ".g:lasttab<cr>
" ----------------------------------------------------------------





" ------ SNIPPETS ---------------------------------------------------
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

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Emmet = digite `g,,` para aplicar o html inserido
let g:user_emmet_leader_key='g,'

" Rainbow Pairs
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"Undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.', 'scp://.']
au FileType gitcommit let b:EditorConfig_disable = 1
" ----------------------------------------------------------------





" ------ Uso do RANGER como FileExplorer---------------------------
map <Leader>t :call RangerExplorer()<CR>

function! RangerExplorer()
	exec 'silent !ranger --choosefile=/tmp/vim_ranger_current_file ' . expand('%:p:h')
	if filereadable('/tmp/vim_ranger_current_file')
		exec 'tabnew ' . system('cat /tmp/vim_ranger_current_file')
		exec 'silent !rm /tmp/vim_ranger_current_file'
	endif
	redraw!
endfunction
" ----------------------------------------------------------------





" ------ CONFIGURAÇÔES EXCLUSIVAS PARA CADA TIPO DE ARQUIVO--------
autocmd FileType javascript call JavaScriptFile()
autocmd FileType typescript call TypeScriptFile()
autocmd FileType css,sass call CssFile()
autocmd FileType python call PythonFile()

function! JavaScriptFile()
	nmap <Leader>r :!node %<CR>
endfunction	

function! TypeScriptFile()
	nmap <Leader>r :!deno %<CR>
endfunction	

function! CssFile()
    inoremap { {<CR>}<esc>O<esc>S
endfunction

function! PythonFile()
	nmap <Leader>r :!python3 %<CR>
endfunction	
