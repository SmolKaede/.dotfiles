vim.g.mapleader = " "

local keymap = vim.keymap -- To make things look nicer
   
-- General keymappings
keymap.set("n", "<leader>nh", ":nohl<CR>") --Remove highlighting

keymap.set("n", "x", '"_x') --Delete character without saving to undo buffer

keymap.set("n", "<leader>+", "<C-a>") --Increment number
keymap.set("n", "<leader>-", "<C-x>") --Decrement number


keymap.set("n", "<leader>sv", "<C-w>v") --Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") --Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") --Make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") --Close current split

keymap.set("n", "<leader>tb", ":tabnew<CR>") --Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") --Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --Next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --Prev tab

--Plugin keymappings

--vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") --Toggle maximize split

--NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") --Toggle NvimTree

--Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
