

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- build = ":Copilot auth",
    event = { "InsertEnter" },
    opts = {
      -- panel = {
      --   enabled = true,
      --   auto_refresh = false,
      --   keymap = {
      --     jump_prev = "[[",
      --     jump_next = "]]",
      --     accept = "<CR>",
      --     refresh = "gr",
      --     open = "<M-CR>"
      --   },
      --   layout = {
      --     position = "bottom", -- | top | left | right
      --     ratio = 0.4
      --   },
      -- },
      -- suggestion = {
      --   enabled = true,
      --   auto_trigger = false,
      --   hide_during_completion = true,
      --   debounce = 75,
      --   -- keymap = {
      --   --   accept = "<M-l>",
      --   --   accept_word = false,
      --   --   accept_line = false,
      --   --   next = "<M-]>",
      --   --   prev = "<M-[>",
      --   --   dismiss = "<C-]>",
      --   -- },
      -- },
      -- filetypes = {
      --   yaml = false,
      --   markdown = false,
      --   help = false,
      --   gitcommit = false,
      --   gitrebase = false,
      --   hgcommit = false,
      --   svn = false,
      --   cvs = false,
      --   ["."] = false,
      -- },
      -- copilot_node_command = 'node', -- Node.js version must be > 18.x
      -- server_opts_overrides = {},
    },
    config = function(_, opts)
      local copilot = require("copilot")
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          copilot.setup(opts)
        end,
      })
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = "copilot",
  --       group_index = 1,
  --       priority = 100,
  --     })
  --   end,
  --   dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
              copilot_cmp._on_insert_enter({})
            end,
          })
        end,
      },
  --   },
  -- }
}