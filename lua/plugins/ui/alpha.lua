local M = {}

table.insert(M,  "goolord/alpha-nvim")

M.event = "VimEnter"

M.dependencies = {
  -- "echasnovski/mini.icons",
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",
}

local generate_header = function(dashboard)
  local function colorize(logo, colors, logoColors)
    -- helper function for utf8 chars
    local function get_char_len(s, pos)
      local byte = string.byte(s, pos)
      if not byte then
        return nil
      end
      return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
    end

    header = dashboard.section.header
    -- dashboard.section.header.val = logo
    header.val = logo

    for key, color in pairs(colors) do
      local name = "Alpha" .. key
      vim.api.nvim_set_hl(0, name, color)
      colors[key] = name
    end

    -- dashboard.section.header.opts.hl = {}
    header.opts.hl = {}
    for i, line in ipairs(logoColors) do
      local highlights = {}
      local pos = 0

      for j = 1, #line do
        local opos = pos
        pos = pos + get_char_len(logo[i], opos + 1)

        local color_name = colors[line:sub(j, j)]
        if color_name then
          table.insert(highlights, { color_name, opos, pos })
        end
      end

      -- table.insert(dashboard.section.header.opts.hl, highlights)
      table.insert(header.opts.hl, highlights)
    end
    -- return dashboard.header
    return header
  end

  return colorize({
    [[  ███       ███  ]],
    [[  ████      ████ ]],
    [[  ████     █████ ]],
    [[ █ ████    █████ ]],
    [[ ██ ████   █████ ]],
    [[ ███ ████  █████ ]],
    [[ ████ ████ ████ ]],
    [[ █████  ████████ ]],
    [[ █████   ███████ ]],
    [[ █████    ██████ ]],
    [[ █████     █████ ]],
    [[ ████      ████ ]],
    [[  ███       ███  ]],
    [[                    ]],
    [[  N  E  O  V  I  M  ]],
  }, {
    ["b"] = { fg = "#3399ff", ctermfg = 33 },
    ["a"] = { fg = "#53C670", ctermfg = 35 },
    ["g"] = { fg = "#39ac56", ctermfg = 29 },
    ["h"] = { fg = "#33994d", ctermfg = 23},
    ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29},
    ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
    ["k"] = { fg = "#30A572", ctermfg = 36},
  }, {
    [[  kkkka       gggg  ]],
    [[  kkkkaa      ggggg ]],
    [[ b kkkaaa     ggggg ]],
    [[ bb kkaaaa    ggggg ]],
    [[ bbb kaaaaa   ggggg ]],
    [[ bbbb aaaaaa  ggggg ]],
    [[ bbbbb aaaaaa igggg ]],
    [[ bbbbb  aaaaaahiggg ]],
    [[ bbbbb   aaaaajhigg ]],
    [[ bbbbb    aaaaajhig ]],
    [[ bbbbb     aaaaajhi ]],
    [[ bbbbb      aaaaajh ]],
    [[  bbbb       aaaaa  ]],
    [[                    ]],
    [[  a  a  a  b  b  b  ]],
  })
end


M.opts = function()
  local dashboard = require("alpha.themes.dashboard")
  local utils = require("alpha.utils")
  local theta = require("alpha.themes.theta")
  -- local icon, color  ("init.lua", "lua")
  local get_icon_color = require('nvim-web-devicons').get_icon_color

  local header = generate_header(dashboard)

  local mru = {
    type = "group",
    val = {
      {
        type = "text",
        val = "Recent files",
        opts = {
          hl = "SpecialComment",
          shrink_margin = false,
          position = "center",
        },
      },
      { type = "padding", val = 1 },
      {
        type = "group",
        val = function()
          return { theta.mru(0, vim.fn.getcwd()) }
        end,
        opts = { shrink_margin = false },
      },
    },
  }

  local button = function(key, icon, title, cmd)
    return dashboard.button(key, icon .. " " .. title, cmd)
  end

  local buttons = {
    type = "group",
      val = {
        { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        button("e", "", "New File", ":ene<cr>"),
        button("f", "", "Find File", ":Telescope fd<cr>"),
        button("g", "", "Live Grep", ":Telescope live_grep<cr>"),
        button("z", "󰡱", "fzf", ":FzfLua<cr>"),
        -- button("c", "", "Neovim Configs", function()
        --   local ok, telescope = pcall(require, "telescope")
        --   if ok then
        --     telescope.extensions.file_browser.file_browser({path = vim.fn.stdpath('config')})
        --   else
        --     vim.cmd("edit " .. vim.fs.joinpath(vim.fn.stdpath("config"), "init.lua"))
        --   end
        -- end),
        button("l", "󰒲", "Lazy", ":Lazy<cr>"),
        button("q", "✗", "Quit", ":qa<cr>"),
      },
    position = "center",
  }


  return {
    layout = {
      { type = "padding", val = 1 },
      header,
      { type = "padding", val = 1 },
      buttons,
      { type = "padding", val = 1 },
      mru,
    },
    opts = {
      margin = 5,
      setup = function()
      vim.api.nvim_create_autocmd('DirChanged', {
        pattern = '*',
        group = "alpha_temp",
        callback = function ()
          require('alpha').redraw()
          vim.cmd('AlphaRemap')
        end,
      })
      end,
    },
  }
end


return M