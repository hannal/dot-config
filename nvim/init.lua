function is_vscode()
  return vim.g.vscode
end

-- ref : https://github.com/josean-dev/dev-environment-files
require("hannal.core.options")
require("hannal.core.keymaps")
if not is_vscode() then
  require("hannal.plugins-setup")
  require("hannal.plugins.comment")
  require("hannal.core.colorscheme")
  require("hannal.plugins.nvim-tree")
  require("hannal.plugins.neodev")
  require("hannal.plugins.gitsigns")
  require("hannal.plugins.treesitter")
  require("hannal.plugins.lsp.mason")
  require("hannal.plugins.lsp.lspsaga")
  require("hannal.plugins.lsp.lspconfig")
  require("hannal.plugins.lsp.null-ls")
  require("hannal.plugins.neotest")
  require("hannal.plugins.lualine")
  require("hannal.plugins.telescope.command-center")
  require("hannal.plugins.telescope")
  require("hannal.plugins.nvim-cmp")
  require("hannal.plugins.autopairs")
  require("hannal.plugins.neogit")
  require("hannal.plugins.diffview")
  require("hannal.plugins.indent-blankline")
  require("hannal.plugins.nvim-dap")
  -- require("hannal.plugins.dart-vim")
  require("hannal.plugins.scope")
  require("hannal.plugins.bufferline")
  require("hannal.plugins.copilot")
end
