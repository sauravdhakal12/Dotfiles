-- GLOBAL
nmap("<space>", "<nop>")
nmap(",", "<nop>")

g.mapleader = ","
g.maplocalleader = " "

-- SETTINGS
opt.compatible = false
opt.wrap = false
opt.errorbells = false
opt.shortmess = "I"
opt.timeoutlen=1500
opt.updatetime = 250

opt.number = true

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false

opt.incsearch = true
opt.hlsearch = true

opt.cursorline = true

opt.scrolloff = 8

-- donot carry comment to the nextline
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

