-- https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim
-- "vscode-neovim.neovimInitVimPaths.darwin": "<this file path>"

vim.g.mapleader = " "

local opt = vim.opt -- for conciseness
local keymap = vim.keymap -- for conciseness

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.iskeyword:append("-") -- consider string-string as whole word
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = true -- highlight the current cursor line

-----------------------------------------
--keymaps
-----------------------------------------

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>nrr", ":luafile ~/.config/vscode/nvim.options.lua<CR>")

-- window
keymap.set("n", "<leader>seh", ":horizontal wincmd =<CR>")
keymap.set("n", "<leader>sev", ":vertical wincmd =<CR>")
keymap.set("n", "<leader>sea", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")
keymap.set("n", "<leader>eo", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
keymap.set(
	"n",
	"<leader>ee",
	"<cmd>call VSCodeNotify('workbench.view.explorer', { 'when': 'viewContainer.workbench.view.explorer.enabled' })<CR>"
)

-- navigate
keymap.set(
	"n",
	"[[",
	"?^class\\s\\|^\\s*def\\s\\|^export\\s*function\\s\\|^function\\s\\|\\(public\\|private\\|protected\\)\\s*<CR>"
)
keymap.set(
	"n",
	"]]",
	"/^class\\s\\|^\\s*def\\s\\|^export\\s*function\\s\\|^function\\s\\|\\(public\\|private\\|protected\\)\\s*<CR>"
)
keymap.set("n", "[c", "?^class\\s<CR>")
keymap.set("n", "]c", "/^class\\s<CR>")
keymap.set("n", "]t", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
keymap.set("n", "[t", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")

-- search
keymap.set("n", "<leader>ff", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
keymap.set("n", "<leader>fs", "<cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>")
keymap.set(
	"n",
	"<leader>fc",
	"<cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>') })<CR>"
)
keymap.set("n", "<leader>fzf", "<cmd>call VSCodeNotify('fzf-quick-open.runFzfSearch')<CR>")
keymap.set(
	"n",
	"zgzg",
	"<cmd>call VSCodeNotify('editor.action.revealDefinition', { 'when': 'editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor' })<CR>"
)
keymap.set(
	"n",
	"zpzp",
	"<cmd>call VSCodeNotify('editor.action.peekDefinition', { 'when': 'editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor' })<CR>"
)

-- editing
keymap.set(
	"n",
	"gcc",
	"<cmd>call VSCodeNotifyVisual('editor.action.commentLine', { 'when': 'editorTextFocus && !editorReadonly' })<CR>"
)
keymap.set(
	"v",
	"gcc",
	"<cmd>call VSCodeNotifyVisual('editor.action.commentLine', { 'when': 'editorTextFocus && !editorReadonly' })<CR>"
)
keymap.set(
	"n",
	"zf",
	"<cmd>call VSCodeNotify('editor.toggleFold', { 'when': 'editorTextFocus && foldingEnabled && neovim.init && neovim.mode == \"normal\"' })<CR>"
)

-- test

keymap.set("n", "<leader>to", "<cmd>call VSCodeNotify('test-explorer.focus')<CR>")
keymap.set("n", "<leader>tl", "<cmd>call VSCodeNotify('test-explorer.rerun', { 'when': 'testExplorerView' } )<CR>") -- repeat the last test run
keymap.set("n", "<leader>te", "<cmd>call VSCodeNotify('workbench.view.testing.focus')<CR>")
keymap.set("n", "<leader>tl", "<cmd>call VSCodeNotify('testing.reRunLastRun')<CR>")
keymap.set(
	"n",
	"<leader>ti",
	"<cmd>call VSCodeNotify('testing.editFocusedTest', { 'when': \"focusedView == 'workbench.view.testing'\" })<CR>"
)
keymap.set(
	"n",
	"<leader>top",
	"<cmd>call VSCodeNotify('testing.showMostRecentOutput', { 'when': 'testing.hasAnyResults' })<CR>"
)
keymap.set("n", "<leader>tj", "<cmd>call VSCodeNotify('testing.runCurrentFile', { 'when': 'editorTextFocus' })<CR>")
keymap.set("n", "<leader>tc", "<cmd>call VSCodeNotify('testing.runAtCursor', { 'when': 'editorTextFocus' })<CR>")
keymap.set(
	"n",
	"<leader>tf",
	"<cmd>call VSCodeNotify('testing.reRunFailTests', { 'when': 'editorTextFocus && testing.isPeekVisible' })<CR>"
)

-- etc
keymap.set(
	"n",
	"\\fw",
	"<cmd>call VSCodeNotify('editor.action.formatDocument', { 'when': 'editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor' })<CR>"
)
