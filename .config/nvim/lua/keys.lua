-- SHORTCUTS

-- easily source
nmap("<leader>sv", ":source ~/.config/nvim/init.lua<CR>")
nmap("<leader>gn", ":vsplit ~/.config/nvim/lua/general.lua<CR>")
nmap("<leader>ky", ":vsplit ~/.config/nvim/lua/keys.lua<CR>")

-- window navigation
nmap("<C-h>", ":wincmd h<CR>")
nmap("<C-j>", ":wincmd j<CR>")
nmap("<C-k>", ":wincmd k<CR>")
nmap("<C-l>", ":wincmd l<CR>")

-- basic save
nmap("<leader>w", ":w<CR>")
nmap("<leader>q", ":q<CR>")
nmap("<leader>wq", ":wq<CR>")

-- leave insert mode
imap("jk" , "<esc>")
imap("<esc>","<nop>")

-- indent in normal mode
nmap("<Tab>", ">>")
nmap("<S-Tab>", "<<")

-- add blank lines
nmap("<leader>o", "o<esc>")
nmap("<leader>O", "O<esc>")

-- remove search highlight
nmap("<leader>h", ":let @/ = ''<CR>")

-- enable Telescope
nmap(";f", ":Telescope find_files<CR>")
