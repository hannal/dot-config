-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end
local utils = require("null-ls.utils")

-- for conciseness
local code_actions = null_ls.builtins.code_actions -- to setup code actions
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
  root_dir = utils.root_pattern(".git", "Makefile"),
  -- setup formatters & linters
  sources = {
    code_actions.gitsigns,
    code_actions.eslint,
    code_actions.eslint_d,

    --  to disable file types use
    --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
    formatting.dart_format, -- dart formatter
    formatting.prettier, -- js/ts formatter
    formatting.stylua, -- lua formatter
    formatting.black,
    -- formatting.black.with({
    --   extra_args = { "--config pyproject.toml" },
    -- }),
    -- formatting.isort,
    formatting.rescript,
    diagnostics.eslint_d.with({ -- js/ts linter
      condition = function(_utils)
        return _utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
      end,
    }),
    diagnostics.flake8.with({
      condition = function(_utils)
        return _utils.root_has_file({ ".flake8", "setup.cfg", "tox.ini", "pyproject.toml" })
      end,
      prefer_local = ".venv/bin",
    }),
    diagnostics.mypy.with({
      runtime_condition = function(params)
        return utils.path.exists(params.bufname)
      end,
      prefer_local = ".venv/bin",
    }),
    diagnostics.pyproject_flake8,
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
