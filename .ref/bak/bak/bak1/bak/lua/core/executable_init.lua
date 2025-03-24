---@diagnostic disable: lowercase-global, undefined-global

unpack = unpack or table.unpack

-- IO
----------------------------------------
require("core.io")

-- Math
----------------------------------------
require("core.math")

-- Misc
----------------------------------------
require("core.misc")

-- Strings
----------------------------------------
require("core.strings")

-- Tables
----------------------------------------
require("core.tables")

-- LFS
----------------------------------------
if lfs then
  require("core.lfs")
end

-- Path
----------------------------------------
require("core.path")

-- Global Variables
----------------------------------------
local utils = require("core.utils")
utils.impatient()
vim.leader = utils.leader
-- vim.options = utils.options
-- vim.map = utils.map

-- Helper Functions
----------------------------------------
prequire = function(mod)
  local status, lib = pcall(require, mod)
  if status then
    return lib
  end
  return nil
end

pcall(function()
  local ok, plenary_reload = pcall(require, "plenary.reload")
  if not ok then
    reloader = require
  else
    reloader = plenary_reload.reload_module
  end

  RELOAD = function(...)
    return reloader(...)
  end

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end)

is_vscode = (function()
  if vim.fn.exists("g:vscode") == 1 then
    return true
  end
  return false
end)()

dump = function(...)
  local args = { n = select("#", ...), ... }
  for i = 1, args.n do
    args[i] = vim.inspect(args[i])
  end
  print(unpack(args))
end

get_os = function()
  local os = vim.loop.os_uname().sysname
  if os == "Darwin" then
    return "macOS"
  elseif os == "Linux" then
    return "Linux"
  elseif os == "Windows" then
    return "Windows"
  else
    return os
  end
end

impatient = function()
  pcall(function()
    require("impatient").enable_profile()
  end)
end

--- Plugin Manager
----------------------------------------
lazy = function(dir)
  dir = dir or "plugins"
  local lazypath = path.join(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
  if vim.fn.empty(vim.fn.glob(lazypath)) > 0 then
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
      })
    end
  end
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup(dir)
end
