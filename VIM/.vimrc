let mapleader=" "

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Confs básicas
Plug 'tpope/vim-sensible'

"Themes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'

"Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

"NerdTree
Plug 'preservim/nerdtree'

"Syntax Highlight
Plug 'sheerun/vim-polyglot'

"BottomBar
Plug 'itchyny/lightline.vim'

"Colorized pairs
Plug 'luochen1990/rainbow'
" Plug 'frazrepo/vim-rainbow'

"Plugins HTML
Plug 'mattn/emmet-vim'

"CtrlP
Plug 'kien/ctrlp.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Comentarios
Plug 'tpope/vim-commentary'

" Linhas de indentação
"Plug 'Yggdroot/indentLine'

call plug#end()





" ----- ABRIR O VIMRC PARA EDITAR --------------------------------
map <F2> :tabnew $MYVIMRC<CR>
" ----------------------------------------------------------------





" ----- Configurações básicas ------------------------------------
set guifont=Ubuntu\ 12

"bar
set laststatus=2

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
set expandtab

"Menu saida quando não salvar antes
set confirm

"Só para colorir quando você for procurar por uma palavar no comand-mode
set incsearch
set hlsearch

"AutoIndentacion
set autoindent
set smarttab
set cindent

"Mouse
set mouse=a
" ----------------------------------------------------------------





" ------- Theme ---------------------------------------------------
syntax on
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu
" ----------------------------------------------------------------





" ------ Light Line -----------------------------------------------
let g:lightline = {
			\ 'colorscheme': 'ayu_mirage',
			\ 'active': {
			\   'right': [ [ 'lineinfo'  ],
			\              [ 'percent'  ],
			\              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex'  ] ]
			\ },
			\ 'component': {
			\   'charvaluehex': '0x%B',
			\   'opa': '%{ReturnIconFileType()}',
			\ },
			\ 'component_function': {
			\   'filetype': 'MyFiletype',
			\   'fileformat': 'MyFileformat',
			\   'iconfiletype': 'ReturnIconFileType'
			\ }
			\ }

let g:lightline.tabline = {
		    \ 'left': [ [ 'tabs', 'iconfiletype']  ],
		    \ 'right': [ [ 'close' ] ] }

let g:lightline.tab_component_function = {
		      \ 'filetype': 'WebDevIconsGetFileTypeSymbol'
			  \ }

let g:lightline.tab = {
	\ 'active': [ 'tabnum', 'filename', 'modified' ],
	\ 'inactive': [ 'tabnum', 'filename', 'modified' ],
	\ }

function!  ReturnIconFileType()
	return WebDevIconsGetFileTypeSymbol()
endfunction

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" ----------------------------------------------------------------





" ------Coc EXTENSÕES --------------------------------------------
" EXTENSÕES
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-css', 'coc-vetur', 'coc-html', 'coc-explorer', 'coc-snippets' ]

" Atalhos
inoremap <silent><expr> <c-space> coc#refresh()
" Seta TAB para escolher as sugestões que aparecerem
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nnoremap <C-z> :CocCommand explorer --preset floating<CR>
nnoremap <Leader>ed :CocCommand explorer --preset .vim<CR>
nnoremap <Leader>ef :CocCommand explorer --preset floating<CR>
nnoremap <Leader>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <Leader>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <Leader>el :CocList explPresets
" ----------------------------------------------------------------





" ------ ATALHOS---------------------------------------------------
"Atalhos de save
map <C-s> :w<CR> 

"Atalho para voltar ao inicio da linha no modo de inserção
inoremap <C-a> <Esc>^i

"Selecionar tudo modo seleção
vnoremap <C-a> <Esc>ggVG

"Ctrl+V (conteudo no clipboard) no modo inserção
inoremap <C-v> <Esc>"+pi

"Ctrl+C no modo VISUAL
vnoremap <C-c> "+y

" Escrever texto (quebrar linhas)
nnoremap <S-q> gq

" Criar linhas sem ir para o modo inserção
nnoremap go o<Esc>
nnoremap gO O<Esc>

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

" AutoPairs para LaTex
inoremap \( \(\)<esc>hi
inoremap \[ \[\]<esc>hi
inoremap \{ \{\}<esc>hi

" Buffers
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>h <C-w>h
map <Leader>l <C-w>l

map <Leader>b :ls<CR>:b  

map <C-h> :bp<CR>
map <C-l> :bn<CR>

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
map <C-w>w :tabclose<CR>

map <C-q> :tabprevious<CR>
map <C-e> :tabnext<CR>

" Ctrl Tab
au TabLeave * let g:lasttab = tabpagenr()
map <silent> <C-TAB> :exe "tabn ".g:lasttab<cr>

" ----------------------------------------------------------------





" ------ Plugins---------------------------------------------------

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"Tecla para ocultar ou mostrar o NerdTree
map <Leader>n :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'

" Emmet = digite `g,,` para aplicar o html inserido
let g:user_emmet_leader_key='g,'

" Rainbow Pairs
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
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
au FileType javascript call JavaScriptFile()
au FileType css call CssFile()
au FileType html call HtmlFile()
au FileType python call PythonFile()
au FileType markdown call MarkdownFile()

function! JavaScriptFile()
	" OMNI => Ctrl+x + Ctrl+o
	set omnifunc=javascriptcomplete#CompleteJS
	nnoremap <C-c> I// <Esc>
	vmap <C-c> :norm I//<CR>
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
	nnoremap <C-c> I# <Esc>
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
