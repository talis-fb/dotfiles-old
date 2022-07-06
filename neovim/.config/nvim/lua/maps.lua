function api_map(mode, shortcut, command, noremap)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap=noremap, silent = false })
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
imap(  ";", ";<c-g>u" )
imap(  ":", ":<c-g>u" )


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

nnoremap(  "<esc><esc>",":nohl<CR><C-L>" )


-- inoremap(  "\(","\(\)<esc>hi" )
-- inoremap(  "\[","\[\]<esc>hi" )
-- inoremap(  "\{","\{\}<esc>hi" )

nnoremap( "zat", ":tab ball<CR>" )

map(  "<Leader>b",":ls<CR>:b" )
nnoremap(  "[b",":bp<CR>" )
nnoremap(  "]b",":bn<CR>" )
nnoremap(  "[B",":bfirst<CR>" )
nnoremap(  "]B",":blast<CR>" )
map(  "<C-q>",":bp<CR>" )
map(  "<C-e>",":bn<CR>" )

map(  "<C-o>",":tabnew" )

map(  "<Leader>1",":LualineBuffersJump 1<CR>" )
map(  "<Leader>2",":LualineBuffersJump 2<CR>" )
map(  "<Leader>3",":LualineBuffersJump 3<CR>" )
map(  "<Leader>4",":LualineBuffersJump 4<CR>" )
map(  "<Leader>5",":LualineBuffersJump 5<CR>" )
map(  "<Leader>6",":LualineBuffersJump 6<CR>" )
map(  "<Leader>7",":LualineBuffersJump 7<CR>" )
map(  "<Leader>8",":LualineBuffersJump 8<CR>" )
map(  "<Leader>9",":LualineBuffersJump 9<CR>" )
map(  "<Leader>w",":tabclose<CR>" )

-- Plugins
nnoremap(  "[g",":Gitsigns prev_hunk<CR>" )
nnoremap(  "]g",":Gitsigns next_hunk<CR>" )

nnoremap( ",term", ":terminal<CR>" )
