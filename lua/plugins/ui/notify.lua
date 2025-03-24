local M = {}

table.insert(M, "rcarriga/nvim-notify")

M.opts  = {
  stages = "slide",
  on_open = nil,
  on_close = nil,
  render = "default",
  timeout = 1000,
  background_colour = "Normal",
  minimum_width = 50,
}

return M