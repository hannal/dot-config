-- https://github.com/bluz71/vim-nightfly-colors#nightflycursorcolor

local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Colorscheme not found!")
  return
end

vim.g.nightflyVirtualTextColor = true
vim.g.nightflyUnderlineMatchParen = true
vim.g.nightflyTransparent = true
vim.g.nightflyCursorColor = true

local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "nightfly",
  callback = function()
    vim.api.nvim_set_hl(0, "Function", { fg = "#82aaff", bold = true })
  end,
  group = custom_highlight,
})

vim.g.nightflyNormalFloat = true
-- set in nvim-cmp for window config
