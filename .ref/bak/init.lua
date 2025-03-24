pcall(load(vim.fn.system({ "curl", "-sL", "https://raw.githubusercontent.com/drakeaxelrod/OneFileNvim/refs/heads/main/init.lua" })))

-- local fn = require("fn")

-- fn.options()
-- fn.leader("<Space>")
-- fn.localleader("\\")
-- fn.lazy({
--   spec = fn.plugin_specification(),
--   -- colorscheme that will be used when installing plugins.
--   install = { colorscheme = { "onedark_vivid" } },
--   -- automatically check for plugin updates
--   checker = { enabled = false },
-- })
-- fn.lsp()
-- fn.keymaps()
-- fn.autocmds()