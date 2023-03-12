-- https://github.com/FeiyouG/command_center.nvim
local command_center_status, command_center = pcall(require, "command_center")
if not command_center then
  return
end

local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

command_center.add({
  --
  -- vim
  -- https://vim.fandom.com/wiki/Using_marks
  {
    desc = "Set current to center",
    cmd = "zz",
    keys = { "n", "zz", noremap },
  },
  {
    desc = "Bookmark as 'A' ('M' + letter)",
    cmd = "<CMD>mark a<CR>",
    keys = { "n", "ma", noremap },
  },
  {
    desc = "Move to the exact location of bookmark 'A' (` + letter)",
    cmd = "`a",
    keys = { "n", "`a", noremap },
  },
  {
    desc = "Jump to the beginning of Bookmark 'A' (' + letter)",
    cmd = "'a",
    keys = { "n", "'a", noremap },
  },
  --
  -- telescope
  {
    desc = "Search inside current buffer",
    cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
    keys = { "n", "<leader>fzf", noremap },
  },
  {
    desc = "Find files within current working directory",
    cmd = "<CMD>Telescope find_files<CR>",
    keys = { "n", "<leader>ff", noremap },
  },
  {
    desc = "Find hidden files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
    keys = { "n", "<leader>fhf", noremap },
  },
  {
    desc = "Find string in current working directory",
    cmd = "<CMD>Telescope live_grep<CR>",
    keys = { "n", "<leader>fs", noremap },
  },
  {
    desc = "Find string under cursor in current working directory",
    cmd = "<CMD>Telescope grep_string<CR>",
    keys = { "n", "<leader>fc", noremap },
  },
  {
    desc = "List open buffers in current neovim instance",
    cmd = "<CMD>Telescope buffers<CR>",
    keys = { "n", "<leader>fb", noremap },
  },
  {
    desc = "List search history",
    cmd = "<CMD>Telescope search_history<CR>",
    keys = { "n", "<leader>fhs", noremap },
  },
  {
    desc = "List command history",
    cmd = "<CMD>Telescope command_history<CR>",
    keys = { "n", "<leader>fhc", noremap },
  },
  {
    desc = "List jump list",
    cmd = "<CMD>Telescope jumplist<CR>",
    keys = { "n", "<leader>jl", noremap },
  },
  {
    desc = "List Telescope help_tags",
    cmd = "<CMD>Telescope help_tags<CR>",
    keys = { "n", "<leader>fhh", noremap },
  },
  --
  -- telescope git
  {
    desc = "List all git commits (use <cr> to checkout)",
    cmd = "<CMD>Telescope git_commits<CR>",
    keys = { "n", "<leader>gc", noremap },
  },
  {
    desc = "List git commits for current file/buffer (use <cr> to checkout)",
    cmd = "<CMD>Telescope git_bcommits<CR>",
    keys = { "n", "<leader>gfc", noremap },
  },
  {
    desc = "List git branches",
    cmd = "<CMD>Telescope git_branches<CR>",
    keys = { "n", "<leader>gb", noremap },
  },
  {
    desc = "Show git status",
    cmd = "<CMD>Telescope git_status<CR>",
    keys = { "n", "<leader>gs", noremap },
  },
  --
  -- lsp
  {
    desc = "Show function signaure (hover)",
    cmd = "<CMD>Lspsaga hover_doc<CR>",
    keys = {
      { "n", "K", silent_noremap },
      { "i", "<C-k>", silent_noremap },
    },
  },
  {
    desc = "Show definition, references",
    cmd = "<CMD>Lspsaga lsp_finder<CR>",
    keys = { "n", "zfzf", silent_noremap },
  },
  {
    desc = "Go to definition",
    cmd = "<CMD>Lspsaga goto_definition<CR>",
    keys = { "n", "zgzg", silent_noremap },
  },
  {
    desc = "Peek definition",
    cmd = "<CMD>Lspsaga peek_definition<CR>",
    keys = { "n", "zpzp", silent_noremap },
  },
  {
    desc = "Show LSP outline",
    cmd = "<CMD>Lspsaga outline<CR>",
    keys = { "n", "<leader>lo", silent_noremap },
  },
  {
    desc = "Show LSP incoming calls",
    cmd = "<CMD>Lspsaga incoming_calls<CR>",
    keys = { "n", "<leader>lci", silent_noremap },
  },
  {
    desc = "Show LSP outcoming calls",
    cmd = "<CMD>Lspsaga outcoming_calls<CR>",
    keys = { "n", "<leader>lc", silent_noremap },
  },
  {
    desc = "Show code action",
    cmd = "<CMD>Lspsaga code_action<CR>",
    -- need to set Left-option to Meta key on Mac OS (see your terminal app)
    keys = { "n", "<M-.>", silent_noremap },
  },
  {
    desc = "Rename by LSP Saga",
    cmd = "<CMD>Lspsaga rename<CR>",
    keys = { "n", "<leader>rn", silent_noremap },
  },
  {
    desc = "Show diagnostics for line",
    cmd = "<CMD>Lspsaga show_line_diagnostics<CR>",
    keys = { "n", "<leader>lld", silent_noremap },
  },
  {
    desc = "Show diagnostics for cursor",
    cmd = "<CMD>Lspsaga show_cursor_diagnostics<CR>",
    keys = { "n", "<leader>lcd", silent_noremap },
  },
  {
    desc = "Jump to previous diagnostic in buffer",
    cmd = "<CMD>Lspsaga diagnostic_jump_prev<CR>",
    keys = { "n", "[d", silent_noremap },
  },
  {
    desc = "Jump to next diagnostic in buffer",
    cmd = "<CMD>Lspsaga diagnostic_jump_next<CR>",
    keys = { "n", "]d", silent_noremap },
  },
  --
  -- null-ls
  {
    desc = "Formatting (null-ls)",
    cmd = "<CMD>lua vim.lsp.buf.format({ async = true })<CR>",
    keys = { "n", "<leader>fmt", silent_noremap },
  },
  --
  -- bufferline
  {
    desc = "Cycle previous buffer",
    cmd = "<CMD>BufferLineCyclePrev<CR>",
    keys = { "n", "[b", silent_noremap },
  },
  {
    desc = "Cycle next buffer",
    cmd = "<CMD>BufferLineCycleNext<CR>",
    keys = { "n", "]b", silent_noremap },
  },
  --
  -- neotest
  {
    desc = "Attach test",
    cmd = "<CMD>lua require('neotest').run.attach()<CR>",
    keys = { "n", "<leader>ta", silent_noremap },
  },
  {
    desc = "Run test file",
    cmd = "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
    keys = { "n", "<leader>tf", silent_noremap },
  },
  {
    desc = "Run test file with Debugger",
    cmd = "<CMD>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>",
    keys = { "n", "<leader>tF", silent_noremap },
  },
  {
    desc = "Run last test",
    cmd = "<CMD>lua require('neotest').run.run_last()<CR>",
    keys = { "n", "<leader>tl", silent_noremap },
  },
  {
    desc = "Run last test with Debugger",
    cmd = "<CMD>lua require('neotest').run.run_last({ strategy = 'dap' })<CR>",
    keys = { "n", "<leader>tL", silent_noremap },
  },
  {
    desc = "Run nearest test",
    cmd = "<CMD>lua require('neotest').run.run()<CR>",
    keys = { "n", "<leader>tl", silent_noremap },
  },
  {
    desc = "Run nearest test with Debugger",
    cmd = "<CMD>lua require('neotest').run.run({ strategy = 'dap' })<CR>",
    keys = { "n", "<leader>tL", silent_noremap },
  },
  {
    desc = "Show test output",
    cmd = "<CMD>lua require('neotest').output.open({ enter = true, last_run = true })<CR>",
    keys = { "n", "<leader>too", silent_noremap },
  },
  {
    desc = "Show test output panel",
    cmd = "<CMD>lua require('neotest').output_panel.toggle({ enter = false })<CR>",
    keys = { "n", "<leader>top", silent_noremap },
  },
  {
    desc = "Stop test",
    cmd = "<CMD>lua require('neotest').run.stop()<CR>",
    keys = { "n", "<leader>tx", silent_noremap },
  },
  {
    desc = "Toggle test summary",
    cmd = "<CMD>lua require('neotest').summary.toggle()<CR>",
    keys = { "n", "<leader>ts", silent_noremap },
  },
  --
  -- Neogit
  {
    desc = "Run neogit",
    cmd = "<CMD>Neogit<CR>",
    keys = { "n", "<leader>gg", silent_noremap },
  },
  --
  -- floatterm : https://github.com/voldikss/vim-floaterm
  -- after normal mode(<C-\><C-n>), move different window
  {
    desc = "floating Terminal on right",
    cmd = "<CMD>FloatermNew --height=0.9 --width=0.3 --wintype=float --name=rightterm --position=bottomright<CR>",
    keys = { "n", "<S-t>r", silent_noremap },
  },
  {
    desc = "floating Terminal on center",
    cmd = "<CMD>FloatermNew --height=0.5 --width=0.5 --wintype=float --name=centerterm --position=auto<CR>",
    keys = { "n", "<S-t>c", silent_noremap },
  },
  {
    desc = "Send selection to terminal",
    cmd = "<CMD>'<,'>FloatermSend ...  --height=0.5 --width=0.4 --wintype=float --name=termforselection --position=auto<CR>",
    keys = { "n", "<S-t>tt", silent_noremap },
  },
  {
    desc = "Open Terminal on right side",
    cmd = "<CMD>FloatermNew --height=1.0 --width=0.25 --wintype=vsplit --name=rightwindow --position=botright<CR>",
    keys = { "n", "<S-t>w", silent_noremap },
  },
  {
    desc = "Open Terminal with python repl",
    cmd = "<CMD>'<,'>FloatermSend ...  --height=0.85 --width=0.25 --wintype=float --name=pyrepl --position=auto<CR>",
    keys = { "n", "<S-t>tp", silent_noremap },
  },
})
