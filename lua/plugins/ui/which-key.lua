return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    -- "nvim-lua/plenary.nvim",
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  -- keys = {
  --   {
  --     "<leader>?",
  --     function()
  --       require("which-key").show({ global = false })
  --     end,
  --     desc = "Buffer Local Keymaps (which-key)",
  --   },
  -- },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  opts = {
    ---@type false | "classic" | "modern" | "helix"
    preset = "modern",
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    ---@param mapping wk.Mapping
    filter = function(mapping)
      -- example to exclude mappings without a description
      -- return mapping.desc and mapping.desc ~= ""
      return true
    end,
    --- You can add any mappings here, or use `require('which-key').add()` later
    ---@type wk.Spec
    spec = {},
    -- show a warning when issues were detected with your mappings
    notify = true,
    -- Start hidden and wait for a key to be pressed before showing the popup
    -- Only used by enabled xo mapping modes.
    ---@param ctx { mode: string, operator: string }
    -- defer = function(ctx)
    --   return ctx.mode == "V" or ctx.mode == "<C-V>"
    -- end,
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
      spelling = { -- use which-key for spelling hints
        enabled = true,
        suggestions = 20,
      },
    },
    -- operators = {
    --   gc = "Comments",
    --   d = "Delete",
    --   c = "Change",
    --   y = "Yank (copy)",
    --   ["g~"] = "Toggle case",
    --   ["gu"] = "Lowercase",
    --   ["gU"] = "Uppercase",
    --   [">"] = "Indent right",
    --   ["<lt>"] = "Indent left",
    --   ["zf"] = "Create fold",
    --   ["!"] = "Filter though external program",
    -- },
    -- key_labels = {
    --   ["<space>"] = "SPC",
    --   ["<cr>"] = "RET",
    --   ["<tab>"] = "TAB",
    -- },

    ----------------------------------------------------------------------------
    -- icon (string): the icon to use (optional)
    -- hl (string): the highlight group to use for the icon (optional)
    -- color (string): the color to use for the icon (optional) valid colors are: azure, blue, cyan, green, grey, orange, purple, red, yellow
    -- cat (string): the category of the icon (optional) valid categories are: file, filetype, extension
    -- name (string): the name of the icon in the specified category (optional)
    ----------------------------------------------------------------------------

    icons = {
      breadcrumb = "…", --"»",
      separator = "->",
      group = "+",
      ellipsis = "…",
      -- set to false to disable all mapping icons,
      -- both those explicitly added in a mapping
      -- and those from rules
      mappings = true,
      --- See `lua/which-key/icons.lua` for more details
      --- Set to `false` to disable keymap icons from rules
      ---@type wk.IconRule[]|false
      -- rules = {
      --   { plugin = "fzf-lua", cat = "filetype", name = "fzf" },
      --   { plugin = "neo-tree.nvim", cat = "filetype", name = "neo-tree" },
      --   { plugin = "octo.nvim", cat = "filetype", name = "git" },
      --   { plugin = "yanky.nvim", icon = "󰅇", color = "yellow" },
      --   { plugin = "zen-mode.nvim", icon = "󱅻 ", color = "cyan" },
      --   { plugin = "telescope.nvim", pattern = "telescope", icon = "", color = "blue" },
      --   { plugin = "trouble.nvim", cat = "filetype", name = "trouble" },
      --   { plugin = "todo-comments.nvim", cat = "file", name = "TODO" },
      --   { plugin = "grapple.nvim", pattern = "grapple", icon = "󰛢", color = "azure" },
      --   { plugin = "nvim-spectre", icon = "󰛔 ", color = "blue" },
      --   { plugin = "grug-far.nvim", pattern = "grug", icon = "󰛔 ", color = "blue" },
      --   { plugin = "noice.nvim", pattern = "noice", icon = "󰈸", color = "orange" },
      --   { plugin = "persistence.nvim", icon = " ", color = "azure" },
      --   { plugin = "neotest", cat = "filetype", name = "neotest-summary" },
      --   { plugin = "lazy.nvim", cat = "filetype", name = "lazy" },
      --   { plugin = "snacks.nvim", icon = "󱥰 ", color = "purple" },
      --   { plugin = "refactoring.nvim", pattern = "refactor", icon = " ", color = "cyan" },
      --   -- { plugin = "alpha-nvim", icon = "󰕮 ", color = "cyan" },
      --   { pattern = "profiler", icon = "⚡", color = "orange" },
      --   { plugin = "CopilotChat.nvim", icon = " ", color = "orange" },
      --   { pattern = "%f[%a]git", cat = "filetype", name = "git" },
      --   { pattern = "terminal", icon = " ", color = "red" },
      --   { pattern = "find", icon = " ", color = "green" },
      --   { pattern = "search", icon = " ", color = "green" },
      --   { pattern = "test", cat = "filetype", name = "neotest-summary" },
      --   { pattern = "lazy", cat = "filetype", name = "lazy" },
      --   { pattern = "buffer", icon = "󰈔", color = "cyan" },
      --   { pattern = "file", icon = "󰈔", color = "cyan" },
      --   { pattern = "window", icon = " ", color = "blue" },
      --   { pattern = "diagnostic", icon = "󱖫 ", color = "green" },
      --   { pattern = "format", icon = " ", color = "cyan" },
      --   { pattern = "debug", icon = "󰃤 ", color = "red" },
      --   { pattern = "code", icon = " ", color = "orange" },
      --   { pattern = "notif", icon = "󰵅 ", color = "blue" },
      --   { pattern = "toggle", icon = " ", color = "yellow" },
      --   { pattern = "session", icon = " ", color = "azure" },
      --   { pattern = "exit", icon = "󰈆 ", color = "red" },
      --   { pattern = "quit", icon = "󰈆 ", color = "red" },
      --   { pattern = "tab", icon = "󰓩 ", color = "purple" },
      --   { pattern = "%f[%a]ai", icon = " ", color = "green" },
      --   { pattern = "ui", icon = "󰙵 ", color = "cyan" },
      -- },
      -- use the highlights from mini.icons
      -- When `false`, it will use `WhichKeyIcon` instead
      colors = true,
      -- used by key format
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        D = "󰘳 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "󰁮",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },
    -- popup_mappings = {
    --   scroll_down = "<c-d>",
    --   scroll_up = "<c-u>",
    -- },
    -- window = {
    --   border = "none",
    --   position = "bottom",
    --   -- padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
    --   margin = { 1, 0, 1, 0 },
    --   padding = { 2, 2, 2, 2 },
    --   winblend = 0,
    -- },
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      -- border = "none",
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    ---@type (string|wk.Sorter)[]
    --- Mappings are sorted using configured sorters and natural sort of the keys
    --- Available sorters:
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    sort = { "local", "order", "group", "alphanum", "mod" },
    ---@type number|fun(node: wk.Node):boolean?
    expand = 0, -- expand groups when <= n mappings
    -- expand = function(node)
    --   return not node.desc -- expand all nodes without a description
    -- end,
    -- Functions/Lua Patterns for formatting the labels
    ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
        -- { "<Space>", "SPC" },
      },
      desc = {
        { "<Plug>%(?(.*)%)?", "%1" },
        { "^%+", "" },
        { "<[cC]md>", "" },
        { "<[cC][rR]>", "" },
        { "<[sS]ilent>", "" },
        { "^lua%s+", "" },
        { "^call%s+", "" },
        { "^:%s*", "" },
      },
    },
    -- ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    debug = false, -- enable wk.log in the current directory
  },
}
