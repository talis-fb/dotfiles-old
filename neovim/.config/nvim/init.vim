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
call plug#begin('~/.vim/plugged')

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
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline' 
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/vim-cursorword'

call plug#end()





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





" ------ Light Line -----------------------------------------------
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'active': {
            \   'right': [ [ 'lineinfo'  ],
            \              [ 'percent'  ],
            \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex'  ] ]
            \ },
            \ 'component': {
            \   'charvaluehex': '0x%B',
            \ },
            \ 'tab_component_function': {
            \   'tabnum': 'lightline#tab#tabnum',
            \   'filetypeicon': 'LightlineWebDevIcons',
            \ },
            \ 'component_function': {
            \   'gitbranch': 'GitBranch',
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \ },
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
            \ }

function! GitBranch()
    return ' ' . FugitiveHead()
endfunction

let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ]  ],
    \ 'right': [ [ 'gitbranch', 'close' ] ] }

let g:lightline.tab = {
	\ 'active': [ 'filetypeicon', 'filename', 'modified' ],
	\ 'inactive': [ 'tabnum', 'filename', 'modified' ],
	\ }

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function!  ReturnIconFileType()
	return WebDevIconsGetFileTypeSymbol()
endfunction

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Sempre mostra as tabs
set showtabline=1
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

" Sair e fechar os buffers
nnoremap <S-q> :bd<CR>

nnoremap Y y$

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Apagar hightlight na pesquisa com /
nnoremap <silent><esc><esc> :noh<CR><esc>

"Atalhos de save
map <C-s> :w<CR> 

"Atalho para voltar ao inicio da linha no modo de inserção
inoremap <C-a> <Esc>^i

"Selecionar tudo modo seleção
vnoremap <C-a> <Esc>ggVG
onoremap aa :<c-u>execute ":normal! ggVG"<CR>

"Ctrl+V Ctrl+C no registor "
inoremap <C-v> <Esc>"+pi
vnoremap <C-c> "+y
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+y$
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" Criar linhas sem ir para o modo inserção
nnoremap go o<Esc>
nnoremap gO O<Esc>

"Mover linhas
" \+j  and   \+k
nmap <Bslash>j ddjP<Esc> 
nmap <Bslash>k ddkP<Esc>

" Lidar com splits views
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <Leader>/ <C-w>v


vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==

" Apaga o hightlight apos uma pesquisa feita com o /
nnoremap <C-L> :nohl<CR><C-L>


   " if empty(a:char)
function Pair(char)
   if a:char == ""
       execute "normal! a("
       return
   endif
   execute "normal! a()"
endfunction

" AutoPairs para LaTex
inoremap \( \(\)<esc>hi
inoremap \[ \[\]<esc>hi
inoremap \{ \{\}<esc>hi

" Separar todos os buffers em tabs
nnoremap zat :tab ball<CR>

" Buffers
map <Leader>b :ls<CR>:b  
map <Leader>h :bp<CR>
map <Leader>l :bn<CR>
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" Windows
map <C-o> :tabnew 

map <Leader>1 1gt<CR>
map <Leader>2 2gt<CR>
map <Leader>3 3gt<CR>
map <Leader>4 4gt<CR>
map <Leader>5 5gt<CR>
map <Leader>6 6gt<CR>
map <Leader>7 7gt<CR>
map <Leader>8 8gt<CR>
map <Leader>9 9gt<CR>
map <Leader>w :tabclose<CR>

map <C-q> :tabprevious<CR>
map <C-e> :tabnext<CR>

" Ctrl Tab
au TabLeave * let g:lasttab = tabpagenr()
map <silent> <C-TAB> :exe "tabn ".g:lasttab<cr>
" ----------------------------------------------------------------





" ------ SNIPPETS ---------------------------------------------------
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>G3kS
" nnoremap ,main :-1read $HOME/.vim/.main.c<CR>3jS
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
