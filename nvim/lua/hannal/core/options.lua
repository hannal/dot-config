local opt = vim.opt -- for conciseness

vim.g.python3_host_prog = "~/.pyenv/versions/py4nvim/bin/python"

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

if not is_vscode() then
  -- split windows
  opt.splitright = true -- split vertical window to the right
  opt.splitbelow = true -- split horizontal window to the bottom
end

opt.scrollback = 100000

opt.iskeyword:append("-") -- consider string-string as whole word

vim.cmd([[ 
  augroup auto_reload_changed_file
    autocmd!
    " autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
    autocmd WinEnter * if !exists('w:created') | setlocal number relativenumber | endif
  augroup end
]])
