-- import lspsaga safely
-- https://github.com/glepnir/lspsaga.nvim
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- use enter to open file with definition preview
  definition = {
    edit = "<CR>",
  },
  diagnostic = {
    on_insert = true,
    on_insert_follow = false,
    insert_winblend = 0,
    show_virt_line = true,
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    --1 is max
    max_width = 0.6,
    custom_fix = nil,
    custom_msg = nil,
    text_hl_follow = false,
    border_follow = true,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g",
    },
  },
  callhierarchy = {
    show_detail = true,
    keys = {
      edit = "e",
      vsplit = "v",
      split = "s",
      tabe = "t",
      jump = "i",
      quit = "q",
      expand_collapse = "t",
    },
  },
  ui = {
    title = true,
    border = "single",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = " ",
    kind = {},
    colors = {
      normal_bg = "#022746",
    },
  },
  lightbulb = {
    enable = true,
    enable_in_insert = false,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  outline = {
    win_position = "right",
    win_with = "lspsaga-outline-panel",
    win_width = 36,
    show_detail = false,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = "i",
      expand_collapse = "t",
      quit = "q",
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = " ",
    ignore_patterns = {},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
})
