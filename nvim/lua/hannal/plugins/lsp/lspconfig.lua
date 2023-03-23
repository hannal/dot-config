-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local path = lspconfig.util.path

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local flutter_status, flutter = pcall(require, "flutter-tools")
if not flutter_status then
  return
end

local keymap = vim.keymap -- for conciseness

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyproject.toml"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  -- return exepath('python3') or exepath('python') or 'python'
  return path.join(".venv/bin", "python")
end

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- moved into command-center.lua
  -- keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references<CR>", opts)
  -- keymap.set("n", "zfzf", "<Cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  -- keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
  keymap.set("n", "<leader>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder<CR>", opts)
  keymap.set("n", "<leader>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder<CR>", opts)
  keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
  -- https://github.com/glepnir/lspsaga.nvim
  -- keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>")
  -- keymap.set("n", "<Leader>lci", "<cmd>Lspsaga incoming_calls<CR>")
  -- keymap.set("n", "<Leader>lco", "<cmd>Lspsaga outgoing_calls<CR>")
  -- keymap.set("n", "<leader>lca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  -- keymap.set("n", "<M-.>", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  -- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  -- keymap.set("n", "<leader>lld", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  -- keymap.set("n", "<leader>lcd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  -- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  -- keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  -- keymap.set("n", "zpzp, "<Cmd>Lspsaga peek_definition<CR>", opts)
  -- keymap.set("n", "zgzg", "<Cmd>Lspsaga goto_definition<CR>", opts)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
-- lspconfig["tailwindcss"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- python
-- lspconfig["pylsp"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   before_init = function(_, config)
--     config.settings.python.pythonPath = get_python_path(config.root_dir)
--   end,
--   settings = {
--     pylsp = {
--       configurationSources = "black",
--       plugins = {
--         black = {
--           enabled = true,
--         },
--         flake8 = {
--           enabled = true,
--         },
--         pylint = {
--           executable = "black",
--         },
--         mypy = {
--           enabled = true,
--         },
--       },
--     },
--   },
-- })

-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- tsserver
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- graphql
lspconfig["graphql"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- eslint
lspconfig["eslint"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- rust
lspconfig["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- dart & flutter
-- lspconfig["dartls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

flutter.setup({
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded",
    -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
    -- please note that this option is eventually going to be deprecated and users will need to
    -- depend on plugins like `nvim-notify` instead.
    -- notification_style = 'native' | 'plugin'
    notification_style = "native",
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = false,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = false,
    },
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = false,
    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {},
    register_configurations = function(paths)
      require("dap").configurations.dart = {
        --        <put here config that you would find in .vscode/launch.json>
      }
    end,
  },
  flutter_path = "/opt/homebrew/bin/flutter", -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = ">", -- character to use for close tag e.g. > Widget
    enabled = true, -- set to false to disable
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false, -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    capabilities = capabilities,
    on_attach = on_attach,
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      --analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
      analysisExcludedFolders = {},
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
    },
  },
})
