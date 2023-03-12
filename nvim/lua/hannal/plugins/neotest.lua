-- https://github.com/nvim-neotest/neotest/blob/master/lua/neotest/config/init.lua
local neotest_status, neotest = pcall(require, "neotest")
if not neotest_status then
  return
end

neotest.setup({
  output_panel = {
    enabled = true,
    open = "botright split | resize 20 | set winfixheight",
  },
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = { justMyCode = false },
      runner = "pytest",
      -- python = ".venv/bin/python",
      -- args = { "-vv", "--asyncio-mode=auto" },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
    require("neotest-jest")({
      jestCommand = "jest --watch",
      jestConfigFile = "jest.config.ts",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-dart")({
      command = "flutter",
      use_lsp = true,
    }),
  },
  output = {
    enabled = true,
    -- open_on_run = "short",
    open_on_run = false,
  },
  quickfix = {
    enabled = true,
    open = false,
  },
  summary = {
    enabled = true,
    animated = true,
    follow = true,
    expand_errors = true,
    open = "botright vsplit | vertical resize 40 | set winfixwidth",
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" },
      expand_all = "e",
      output = "o",
      short = "O",
      attach = "a",
      jumpto = "i",
      stop = "u",
      run = "r",
      debug = "d",
      mark = "m",
      run_marked = "R",
      debug_marked = "D",
      clear_marked = "M",
      target = "t",
      clear_target = "T",
      next_failed = "J",
      prev_failed = "K",
    },
  },
})
