local opt = vim.opt --Makes life easier

--Line numbers
opt.relativenumber = true
opt.number = true

--Tabs and indenting
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--Line wrap
opt.wrap = false

--Search
opt.ignorecase = true
opt.smartcase = true

--Cursor line
opt.cursorline = false

--Pretty things
opt.termguicolors = true
opt.signcolumn = "yes"

--Backspace
opt.backspace = "indent,eol,start"

--Split windows
opt.splitright = true
opt.splitbelow = true

--Keep some lines on screen
opt.scrolloff = 11
