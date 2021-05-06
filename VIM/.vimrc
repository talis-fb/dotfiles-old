let mapleader=" "

"Plugins
call plug#begin('~/.vim/plugged')

"AutoComplete CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Themes
Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'

"Surround
Plug 'tpope/vim-surround'
"For active function of '.' with Surround plugin
Plug 'tpope/vim-repeat'

"NerdTree
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'

"Ranger
"Plug 'Mizuchi/vim-ranger'

"Syntax Highlight
Plug 'sheerun/vim-polyglot'

"BottomBar
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'


"Colorized pairs
"Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'

"Plugins HTML
Plug 'mattn/emmet-vim'

"CtrlP
Plug 'kien/ctrlp.vim'

"Plugin for Edit TEXT
Plug 'junegunn/goyo.vim'

call plug#end()

"bar
set laststatus=2
let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\   'right': [ [ 'lineinfo'  ],
			\              [ 'percent'  ],
			\              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex'  ] ]
			\ },
			\ 'component': {
			\   'charvaluehex': '0x%B'
			\ },
			\ }


" THEME 
colorscheme gruvbox
set background=dark
syntax on

" Show Keys Pressed
set showcmd

" Configurar linhas e numeros nela
set encoding=UTF-8
set hidden
set number
set relativenumber
set nowrap

"Destaque na linha onde está o cursor
set cursorline

"Indentização
set tabstop=4
set shiftwidth=4 

"Menu saida quando não salvar antes
set confirm

"Só para colorir quando você for procurar por uma palavar no comand-mode
set incsearch
set hlsearch

"AutoIndentacion
set autoindent

"Mouse
"set mouse=a

" -------------------------
"          ATALHOS
" -------------------------
"
"
"Atalho para criar linhas sem ir para o modo de inserção
nnoremap go o<Esc>
nnoremap gO O<Esc>

"Atalhos de save
map <C-s> :w<CR> 

"Atalho para voltar ao inicio da linha no modo de inserção
inoremap <C-a> <Esc>^i

"Ctrl+V (conteudo no clipboard) no modo inserção
inoremap <C-v> <Esc>"+pi

"Ctrl+C no modo VISUAL
vnoremap <C-c> "+y

"Selecionar tudo no modo seleção
vnoremap <C-a> <Esc>ggVG



"	NERDTree
"Para ligar o NerdTree smp ao iniciar o VIM
"autocmd VimEnter * NERDTree | wincmd p
"autocmd BufWinEnter * silent NERDTreeMirror

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"Tecla para ocultar ou mostrar o NerdTree
map <Leader>n :NERDTreeToggle<CR>


"CtrlP
let g:ctrlp_map = '<c-f>'

"Mover linhas
" \+j  and   \+k
nmap <Bslash>j ddjP<Esc>
nmap <Bslash>k ddkP<Esc>

"AutoPairs
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i

" Emmet (FOR HTML)
" press the type of a tag html like div.class or a#classbutton
" and then press Ctrl+y+,

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"---------------------
"     SPLITCREEN
"---------------------
"map <C-v> :vsplit 
" O VIM Já tem atalhos para isso...
" ^W = Ctrl+w
" ^w+v = :vsplit
" ^w+c = :close
"
" MUDAR O FOCO
" ^w+l = muda o cursor para o buffer da direita
" ^w+h = muda o cursor para o buffer da esquerda
"

" ----------------------------------------
"     Uso do RANGER como FileExplorer
" ----------------------------------------
map <Leader>t :call RangerExplorer()<CR>

function! RangerExplorer()
	exec 'silent !ranger --choosefile=/tmp/vim_ranger_current_file ' . expand('%:p:h')
	if filereadable('/tmp/vim_ranger_current_file')
		exec 'tabnew ' . system('cat /tmp/vim_ranger_current_file')
		exec 'silent !rm /tmp/vim_ranger_current_file'
	endif
	redraw!
endfunction


"----------------
"     WINDOWS
"----------------

map <C-o> :tabnew 

" Switch to the number of window
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

" Tmb pode usar: Ctrl+PageUp , gT
map <Leader>q :tabprevious<CR>
" Tmb pode usar: Ctrl+PageDown , gt
map <Leader>e :tabnext<CR>

" Vai para a ultima aba ativa
au TabLeave * let g:lasttab = tabpagenr()
map <silent> <Leader><TAB> :exe "tabn ".g:lasttab<cr>

"---------------
"    BUFFERS
"---------------

 
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>h <C-w>h
map <Leader>l <C-w>l

map <Leader>b :ls<CR>:b  

map <C-h> :bp<CR>
map <C-l> :bn<CR>

" Para quando abrir um novo arquivo sempre abrir ele numa nova tab
"au BufAdd,BufNewFile * nested tab sball


"COC
inoremap <silent><expr> <c-space> coc#refresh()

"Seta TAB para escolher as sugestões que aparecerem
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" ---------------------------------------------------
" CONFIGURAÇÔES EXCLUSIVAS PARA CADA TIPO DE ARQUIVO
" ---------------------------------------------------
au FileType javascript call JavaScriptFile()
au FileType typescript call JavaScriptFile()
au FileType css call CssFile()
au FileType html call HtmlFile()
au FileType python call PythonFile()
au FileType markdown call MarkdownFile()



function! JavaScriptFile()
	" OMNI => Ctrl+x + Ctrl+o
	set omnifunc=javascriptcomplete#CompleteJS
	nnoremap <C-k> I// <Esc>
	vmap <C-k> :norm I//<CR>
	imap <C-p> console.log(
	nmap <Leader>r :!node %<CR>
endfunction	

function! CssFile()
	set omnifunc=csscomplete#CompleteCSS

	" Seta as chaves como sempre são usadas
	inoremap { {<CR>}<esc>kA<CR>
endfunction


function! HtmlFile()
	set omnifunc=htmlcomplete#CompleteTags
endfunction	


function! PythonFile()
	nnoremap <C-k> I# <Esc>
	vmap <C-k> :norm I#<CR>
	imap <C-p> print()<Esc>hi
	nmap <Leader>r :!python3 %<CR>
endfunction	


function! MarkdownFile()
	nnoremap j gj 
	nnoremap k gk
	"set tw=70
	set wrap
	autocmd VimEnter * Goyo
	set relativenumber
endfunction	

