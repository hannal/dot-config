-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- keymap.set("n", "nrr", ":source $MYVIMRC<CR>")
keymap.set("n", "nrr", ":luafile ~/.config/nvim/init.lua<CR>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
-- keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>seh", ":horizontal wincmd =<CR>") -- make equalize horizontal window
keymap.set("n", "<leader>sev", ":vertical wincmd =<CR>") -- make equalize vertical window
keymap.set("n", "<leader>sea", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<C-w>n", ":tabnew<CR>") -- open new tab
keymap.set("n", "<C-w>c", ":tabclose<CR>") -- close current tab
keymap.set("n", "<C-w>]", ":tabn<CR>") --  go to next tab
keymap.set("n", "<C-w>[", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<C-w>l", ":tabs<CR>") --  tab list

-- jump
-- keymap.set("n", "<leader>jl", ":jumps<CR>") --  print the jump list

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/keymap.lua
keymap.set("n", "<leader>eo", "<cmd>NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>ee", ":NvimTreeFocus<CR>") -- toggle file explorer

-- telescope
-- moved into command-center.lua
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
-- keymap.set("n", "<leader>fzf", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
-- keymap.set("n", "<leader>fhc", "<cmd>Telescope command_history<cr>")
-- keymap.set("n", "<leader>fhs", "<cmd>Telescope search_history<cr>")
-- keymap.set("n", "<leader>fqf", "<cmd>Telescope quickfix<cr>")
-- keymap.set("n", "<leader>jl", "<cmd>Telescope jumplist<cr>")
-- keymap.set("n", "<leader>fhh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<S-p>", "<cmd>Telescope command_center<cr>") -- shift - p

-- telescope git commands
-- moved into command-center.lua
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

-- neogit
-- https://github.com/TimUntersberger/neogit#status-keybindings
-- keymap.set("n", "<leader>gg", ":Neogit<CR>")

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

-- neotest
-- moved into command-center.lua
-- keymap.set("n", "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>") -- Attach
-- keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>") -- Run file
-- keymap.set("n", "<leader>tF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>") -- Run Debug file
-- keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>") -- run last
-- keymap.set("n", "<leader>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>") -- run debug last
-- keymap.set("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>") -- run nearest
-- keymap.set("n", "<leader>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>") -- run debug nearest
-- keymap.set("n", "<leader>too", "<cmd>lua require('neotest').output.open({ enter = true, last_run = true })<cr>") -- output
-- keymap.set("n", "<leader>top", "<cmd>lua require('neotest').output_panel.toggle({ enter = false })<cr>") -- output panel
-- keymap.set("n", "<leader>tx", "<cmd>lua require('neotest').run.stop()<cr>") -- stop
-- keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>") -- summary

-- null-ls
-- moved into command-center.lua
-- keymap.set("n", "<leader>fmt", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")

-- bufferline
keymap.set("n", "<C-g>p", ":BufferLinePick<CR>")
keymap.set("n", "<C-g>u", ":BufferLinePickClose<CR>")
keymap.set("n", "<leader>01", "<Cmd>lua require('bufferline').go_to_buffer(1, true)<CR>")
keymap.set("n", "<leader>02", "<Cmd>lua require('bufferline').go_to_buffer(2, true)<CR>")
keymap.set("n", "<leader>03", "<Cmd>lua require('bufferline').go_to_buffer(3, true)<CR>")
keymap.set("n", "<leader>04", "<Cmd>lua require('bufferline').go_to_buffer(4, true)<CR>")
keymap.set("n", "<leader>05", "<Cmd>lua require('bufferline').go_to_buffer(5, true)<CR>")
keymap.set("n", "<leader>06", "<Cmd>lua require('bufferline').go_to_buffer(6, true)<CR>")
keymap.set("n", "<leader>07", "<Cmd>lua require('bufferline').go_to_buffer(7, true)<CR>")
keymap.set("n", "<leader>08", "<Cmd>lua require('bufferline').go_to_buffer(8, true)<CR>")
keymap.set("n", "<leader>09", "<Cmd>lua require('bufferline').go_to_buffer(9, true)<CR>")
keymap.set("n", "<leader>10", "<Cmd>lua require('bufferline').go_to_buffer(10, true)<CR>")
keymap.set("n", "<leader>$", "<Cmd>lua require('bufferline').go_to_buffer(-1, true)<CR>")
-- keymap.set("n", "[b", ":BufferLineCyclePrev<CR>")
-- keymap.set("n", "]b", ":BufferLineCycleNext<CR>")
