local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    shorten_path = true,
    -- path_display = { "smart" },
    path_display = { shorten = { len = 3, exclude = { -3, -2, -1 } } }, -- hidden, tail, absolute, smart, shortten, truncate
    winblend = 1,
    layout_config = {
      width = 0.70,
      height = 0.75,
      preview_width = 0.60,
      anchor = "SE", -- E, SE, S, SW, W, NW, W, NE, CENTER
    },
    preview = {
      filesize_limit = 1, -- MB
    },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("flutter")
telescope.load_extension("frecency")
telescope.load_extension("command_center")
