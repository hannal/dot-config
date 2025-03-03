local vscode = require('vscode')
vim.g.mapleader = " "

local opt = vim.opt
local keymap = vim.keymap

opt.backspace = "indent,eol,start"
opt.iskeyword:append("-")
opt.clipboard:append("unnamedplus")
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>eo", function() vscode.call('workbench.action.toggleSidebarVisibility') end)
keymap.set("n", "<leader>ee", function() vscode.call('workbench.view.explorer') end)

keymap.set("n", "<leader>ff", function() vscode.call('workbench.action.quickOpen') end)
keymap.set("n", "<leader>fs", function() vscode.call('workbench.action.findInFiles') end)
keymap.set("n", "<leader>fc", function()
    vscode.call('workbench.action.findInFiles', { query = vim.fn.expand('<cword>') })
end)

keymap.set("n", "<leader>fzf", function() vscode.call('fzf-quick-open.runFzfSearch') end)
keymap.set("n", "zgzg", function() vscode.call('editor.action.revealDefinition') end)
keymap.set("n", "zj", "o<Esc>k")
keymap.set("n", "zk", "O<Esc>j")
keymap.set("n", "<leader>rn", function() vscode.call('editor.action.rename') end)
keymap.set("n", "zf", function() vscode.call('editor.toggleFold') end)
keymap.set("n", "<leader>to", function() vscode.call('test-explorer.focus') end)
keymap.set("n", "<leader>tl", function() vscode.call('testing.reRunLastRun') end)
keymap.set("n", "<leader>tc", function() vscode.call('testing.runAtCursor') end)
keymap.set("n", "<leader>tf", function() vscode.call('testing.runCurrentFile') end)
