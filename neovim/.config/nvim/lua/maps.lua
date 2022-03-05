function api_map(mode, shortcut, command, noremap)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap=noremap, silent = true })
end

function map(shortcut, command)
  api_map('', shortcut, command, false)
end

function nmap(shortcut, command)
  api_map('n', shortcut, command, false)
end

function imap(shortcut, command)
  api_map('i', shortcut, command, false)
end

function vmap(shortcut, command)
  api_map('v', shortcut, command, false)
end

function nnoremap(shortcut, command)
  api_map('n', shortcut, command, true)
end

function inoremap(shortcut, command)
  api_map('i', shortcut, command, true)
end

function vnoremap(shortcut, command)
  api_map('v', shortcut, command, true)
end

function onoremap(shortcut, command)
  api_map('o', shortcut, command, true)
end

-- MAPS
--
nmap( "<S-q>", ":bd<CR>" )

nmap(  "Y", "y$" )

imap(  ",", ",<c-g>u" )
imap(  ".", ".<c-g>u" )
imap(  "!", "!<c-g>u" )
imap(  "?", "?<c-g>u" )


nnoremap(  "<silent><esc><esc>", ":noh<CR><esc>" )

map(  "<C-s>", ":w<CR>" )

inoremap(  "<C-a>", "<Esc>^i" )

vnoremap( "<C-a>","<Esc>ggVG" )
onoremap( 'aa', ':<c-u>execute ":normal! ggVG"<CR>')

inoremap(  '<C-v>', '<Esc>"+pi' )
vnoremap(  '<C-c>', '"+y' )
nnoremap(  '<Leader>y', '"+y' )
nnoremap(  '<Leader>Y', '"+y$' )
nnoremap(  '<Leader>p', '"+p' )
nnoremap(  '<Leader>P', '"+P' )

nnoremap( "go", "o<Esc>")
nnoremap( "gO", "O<Esc>")

nmap(  "<Bslash>j", "ddjP<Esc>" )
nmap( "<Bslash>k", "ddkP<Esc>")

map(  "<C-j>","<C-w>j" )
map(  "<C-k>","<C-w>k" )
map(  "<C-h>","<C-w>h" )
map(  "<C-l>","<C-w>l" )

map(  "<Leader>/","<C-w>v" )


vnoremap(  "<C-j>"," :m '>+1<CR>gv=gv" )
vnoremap(  "<C-k>", ":m '<-2<CR>gv=gv" )
nnoremap(  "<Leader>j", ":m .+1<CR>==" )
nnoremap(  "<Leader>k", ":m .-2<CR>==" )

nnoremap(  "<C-L>",":nohl<CR><C-L>" )


-- inoremap(  "\(","\(\)<esc>hi" )
-- inoremap(  "\[","\[\]<esc>hi" )
-- inoremap(  "\{","\{\}<esc>hi" )

nnoremap( "zat", ":tab ball<CR>" )

map(  "<Leader>b",":ls<CR>:b" )
map(  "<Leader>h",":bp<CR>" )
map(  "<Leader>l",":bn<CR>" )
nnoremap(  "[b",":bp<CR>" )
nnoremap(  "]b",":bn<CR>" )
nnoremap(  "[B",":bfirst<CR>" )
nnoremap(  "]B",":blast<CR>" )

map(  "<C-o>",":tabnew" )

map(  "<Leader>1","1gt<CR>" )
map(  "<Leader>2","2gt<CR>" )
map(  "<Leader>3","3gt<CR>" )
map(  "<Leader>4","4gt<CR>" )
map(  "<Leader>5","5gt<CR>" )
map(  "<Leader>6","6gt<CR>" )
map(  "<Leader>7","7gt<CR>" )
map(  "<Leader>8","8gt<CR>" )
map(  "<Leader>9","9gt<CR>" )
map(  "<Leader>w",":tabclose<CR>" )

map(  "<C-q>",":tabprevious<CR>" )
map(  "<C-e>",":tabnext<CR>" )
