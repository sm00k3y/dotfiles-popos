vim.g.mapleader = ","

local keymap = vim.keymap

-- general keymaps

-- exiting insert mode
keymap.set("i", "jk", "<ESC>")

-- Ctrl-S in insert and normal mode saves file
keymap.set({"n", "i"}, "<C-s>", "<cmd>:w<cr><ESC>")

-- keymap.set("n", "x", '"_x"')

-- keymap.set("n", "<leader>pv", ":Ex<CR>")

-- window splitting
keymap.set("n", "<leader>s-", "<C-w>s")
keymap.set("n", "<leader>s\\", "<C-w>v")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>q", ":close<CR>")

-- move visual lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- pasting without loosing current buffer
keymap.set("x", "<leader>p", [["_dP]])
keymap.set({"n", "v"}, "<leader>dd", [["_d]])

-- plugin keymaps

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- formatting
keymap.set("n", "<leader>fr", "<cmd>lua vim.lsp.buf.format()<cr>")
