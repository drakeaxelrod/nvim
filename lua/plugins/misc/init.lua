
local telescope = require("plugins.misc.telescope")
local smart_splits = require("plugins.misc.smart-splits")
local hop = require("plugins.misc.hop")
local mini = require("plugins.misc.mini")
return {
  -- {
  --   "ibhagwan/fzf-lua",
  --   -- optional for icon support
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     -- calling `setup` is optional for customization
  --     require("fzf-lua").setup({})
  --   end
  -- },
  telescope,
  smart_splits,
  hop,
  -- mini,
}