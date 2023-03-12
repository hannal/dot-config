local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("folke/neodev.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use({ "bluz71/vim-nightfly-colors", as = "nightfly" }) -- preferred colorscheme

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  use("tpope/vim-surround") -- ys w ", ds "
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use("numToStr/Comment.nvim") -- gcc, gc9j

  -- file explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      -- vs-code like icons
      "nvim-tree/nvim-web-devicons",
    },
  })

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
  }) -- fuzzy finder
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } })
  use({ "FeiyouG/command_center.nvim" })

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("nvim-treesitter/nvim-treesitter-context")

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- neogit
  use({ "TimUntersberger/neogit", requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" } })

  -- indent blankline
  use({ "lukas-reineke/indent-blankline.nvim" })

  -- dart & flutter
  use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })
  -- use({ "dart-lang/dart-vim-plugin", requires = {
  --   "natebosch/vim-lsc",
  --   "natebosch/vim-lsc-dart",
  -- } })

  -- edgedb plugin
  use({ "edgedb/edgedb-vim" })

  -- vim-neotest
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-vim-test",
      "sidlatau/neotest-dart",
    },
  })

  -- markdown
  -- https://github.com/preservim/vim-markdown
  use("godlygeek/tabular")
  use("preservim/vim-markdown")

  -- nvim debugger adapter
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

  if is_vscode() then
    use({ "asvetliakov/vim-easymotion", as = "vsc-easymotion" })
  end

  use("github/copilot.vim")

  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = { "nvim-tree/nvim-web-devicons", "tiagovla/scope.nvim" },
  })

  -- https://github.com/voldikss/vim-floaterm
  use("voldikss/vim-floaterm")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
