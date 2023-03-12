-- https://github.com/rcarriga/nvim-dap-ui
local neodev_status, neodev = pcall(require, "neodev")
if not neodev_status then
  return
end

neodev.setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
