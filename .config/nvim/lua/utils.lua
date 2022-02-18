-- API ALIAS
opt = vim.opt     -- global/buffer/window-scoped options
cmd = vim.cmd     -- execute vim commands
fn = vim.fn       -- call vim functions
g = vim.g         -- global variables

map = vim.api.nvim_set_keymap    -- keybindings
buf_map = vim.api.nvim_buf_set_keymap     -- keybinds(buffer)
default_opts = {noremap = true, silent = true} -- options

-- nnoremap
function nmap(shortcut, command)
  map("n", shortcut , command , default_opts)
end

function buf_n(shortcut, command)
  buf_map(bufnr, "n", shortcut, command, default_opts)
end

-- inoremap
function imap(shortcut, command)
  map("i", shortcut , command , default_opts)
end

-- vnoremap
function vmap(shortcut, command)
  map("v", shortcut , command , default_opts)
end


-- Turn autocomplete on/off
function auto_cmp(act)
  if act then
    cmd("lua require('cmp').setup.buffer { enabled = true }")
  elseif not act then
    cmd("lua require('cmp').setup.buffer { enabled = false }")
  else
    print("Invalid cmd")
  end
end


local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
