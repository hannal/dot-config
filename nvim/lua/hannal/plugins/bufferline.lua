-- https://github.com/akinsho/bufferline.nvim#configuration
local setup, bufferline = pcall(require, "bufferline")
if not setup then
  return
end

bufferline.setup({
  options = {
    mode = "buffers", -- "buffers" | "tabs"
    separator_style = "slant",
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },
    indicator = {
      -- icon = "▎", -- this should be omitted if indicator style is not 'icon'
      -- style = "icon" | "underline" | "none",
      style = "underline",
    },
    diagnostics = "nvim_lsp",
    color_icons = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if context.buffer:current() then
        return ""
      end

      return ""
    end,
    groups = {
      options = {
        toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "Tests", -- Mandatory
          highlight = { underline = true, sp = "blue" }, -- Optional
          priority = 2, -- determines where it will appear relative to other groups (Optional)
          auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
          icon = "", -- Optional
          matcher = function(buf) -- Mandatory
            return buf.filename:match("test_%.py")
              or buf.filename:match("%_test")
              or buf.filename:match("tests")
              or buf.filename:match("%.spec")
              or buf.filename:match("%.test")
          end,
          separator = { -- Optional
            style = require("bufferline.groups").separator.tab,
          },
        },
      },
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File explorer",
        -- text = function()
        --   return vim.fn.getcwd()
        -- end,
        highlight = "Directory",
        separator = true, -- use a "true" to enable the default, or set your own character
        text_align = "left",
        -- offset_separator = "=",
      },
    },
  },
})
