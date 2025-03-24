local M = {}

------------------------------------------------------------
-- Autocommands
------------------------------------------------------------
local setup = function()
  local augroup = function(name)
    return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
  end

  vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    desc = "Highlight on yank",
    pattern = "*",
    callback = function()
      vim.highlight.on_yank { higroup = "WildMenu", timeout = 200 }
    end
  })


  vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup("json_file"),
    desc = "Wrap on enter for json files",
    pattern = { "*.json", "*.jsonc" },
    callback = function()
      vim.wo.wrap = true
    end
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("treesitter_zsh"),
    pattern = { "sh", "zsh" },
    callback = function()
      require("nvim-treesitter.highlight").attach(0, "bash")
    end
  })

  vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup("termopen"),
    desc = "TermOpen Fix",
    pattern = "*",
    callback = function()
      vim.cmd("setlocal statusline= listchars= nonumber norelativenumber")
      -- vim.cmd("startinsert")
    end
  })


  vim.api.nvim_create_autocmd("VimResized", {
    group = augroup("vimresized"),
    desc = "Auto resize windows",
    pattern = "*",
    callback = function()
      vim.cmd "wincmd ="
    end
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("fix_mini_indent"),
    desc = "Disable miniindent for NvimTree, Telescope and startup",
    -- pattern = "NvimTree,NeoTree,Telescope,Alpha,startup,neo-tree*,eagle,lspsaga,FzfLua,[No Name]",
    -- better pattern
    pattern = { "NvimTree", "Telescope", "Alpha", "startup", "eagle", "lspsaga", "FzfLua", "[No Name]" },
    callback = function()
      vim.b.miniindentscope_disable = true
    end
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaClosed",
    callback = function()
      vim.b.miniindentscope_disable = false
    end,
  })
end

return setmetatable(M, {
  __call = function()
    -- Setyp function
    setup()
  end
})