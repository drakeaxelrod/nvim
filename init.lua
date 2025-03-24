local core = require("core")

-- Make sure to setup leaders, and options before
-- loading lazy.nvim so that mappings are correct.
-- core.keys.leader(" ")
-- core.keys.localleader("\\")
vim.keymap.set({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = vim.api.nvim_replace_termcodes(" ", true, true, true)
vim.g.maplocalleader = vim.api.nvim_replace_termcodes("\\", true, true, true)
core.opts()

-- Setup lazy plugin manager
core.lazy()

-- Attempt to set colorscheme
pcall(vim.cmd.colorscheme, "catppuccin")

-- Setup LSP
core.lsp()

-- keybindings
core.keys()

-- commands
core.cmds()



--[[
  Configurations to checkout

  - https://github.com/pynappo/dotfiles/tree/a2bd8a791260ec78433c6a9aac7df3aefdceb341/.config/nvim


  Design your own version of the menu plugin
  - https://github.com/nvzone/menu
]]






















-- require("global")

-- require("core")

-- local inspection = vim.inspect(vim)

-- write to a file
-- local function write_file(path, content)
--   local file = io.open(path, "w")
--   file:write(content)
--   file:close()
-- end

-- -- get colorsches
-- write_file("colorschemes.lua", vim.inspect(vim.fn.getcompletion("", "color")))

-- _G.is_vscode = false
-- if vim.fn.exists("g:vscode") == 1 then
--   _G.is_vscode = true
-- end

-- vim.inspect(vim)

-- local opts = require("core.opts")
-- local keys = require("core.keys")
-- local lazy = require("core.lazy")
-- local lsp = require("core.lsp")
-- local cmds = require("core.cmds")

-- -- Make sure to setup `mapleader` and `maplocalleader` before
-- -- loading lazy.nvim so that mappings are correct.
-- keys.leader(" ")
-- keys.localleader("\\")
-- -- This is also a good place to setup other settings (vim.opt)
-- opts.setup()

-- lazy.setup()

-- -- Attempt to set colorscheme
-- pcall(vim.cmd.colorscheme, "onedark_vivid")

-- -- Setup LSP
-- lsp.setup()

-- -- keybindings
-- keys.setup()

-- -- commands
-- cmds.setup()
