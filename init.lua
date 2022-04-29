if require("lib.api") and pcall(require("impatient").enable_profile) then
  vim.api.nvim_set_var("did_load_filetypes", true)
  vim.api.nvim_set_var("cursorhold_updatetime", 100)
  vim.api.nvim_set_var("mapleader", " ")
  vim.api.nvim_set_var("maplocalleader", " ")
  vim.keymap.set({ "v", "n" }, "<space>", "<Nop>", { noremap = true })
  require("conf.opts")
  require("conf.keys").common()
  require("conf.cmds")
  require("modules")
  require("langs")
end
