-- REFERENCE https://github.com/VonHeikemen/lsp-zero.nvim

local M = {}

M.setup = function()

  -- Reserve a space in the gutter
  vim.opt.signcolumn = 'yes'

  --[[ LSP ]]
  local lspconfig_defaults = require("lspconfig").util.default_config
  lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
  )

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })

  local diagnostic_signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignInfo", text = " " },
    { name = "DiagnosticSignHint", text = "󰌵" },
  }
  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name })
  end

  --[[ LSP Zero ]]

  local lsp_zero = require("lsp-zero")
  lsp_zero.extend_lspconfig({
    sign_text = true,
    float_border = 'rounded',
    -- lsp_attach = function(client, buf)
      -- keymaps.lsp_attach(client, buf)
    -- end,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  })

  --[[ Mason ]]

  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "tinymist",
      "gopls",
      -- "bash-language-server",
      -- "pyright",
    },
    handlers = {
      -- this first function is the "default handler"
      -- it applies to every language server without a "custom handler"
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,

      bashls = require("lspconfig")["bashls"].setup({
        filetypes = { "sh", "zsh" },
      }),
      lua_ls = require("core.servers.lua_ls"),
    }
  })

  --[[ Completion ]]

  local cmp = require("cmp")
  local comparator = require("cmp-under-comparator")
  local cmp_action = lsp_zero.cmp_action()
  local cmp_format = lsp_zero.cmp_format({details = true})
  -- cmp_format.source_names = {
  --   nvim_lsp = "(LSP)",
  --   emoji = "(Emoji)",
  --   path = "(Path)",
  --   calc = "(Calc)",
  --   cmp_tabnine = "(Tabnine)",
  --   vsnip = "(Snippet)",
  --   luasnip = "(Snippet)",
  --   buffer = "(Buffer)",
  --   tmux = "(TMUX)",
  --   copilot = "(Copilot)",
  --   treesitter = "(TreeSitter)",
  -- }
  -- dump(cmp_format)
  -- this is the function that loads the extra snippets
  -- from rafamadriz/friendly-snippets
  require("luasnip.loaders.from_vscode").lazy_load()

  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  cmp.setup({
    experimental = {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    },
    preselect = cmp.PreselectMode.None,
    sorting = {
      priority_weight = 2,
      comparators = {
        require("copilot_cmp.comparators").prioritize,
        require("copilot_cmp.comparators").score,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        comparator.under,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
    completion = {
      completeopt = "menu,menuone,noinsert,noselect",
    },
    sources = {
      { name = "path" },
      { name = "nvim_lsp" },
      { name = "luasnip", keyword_length = 2 },
      { name = "buffer", keyword_length = 3 },
      { name = "copilot", group_index = 1, priority = 100, }
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      -- confirm completion item
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),

      -- trigger completion menu
      ["<C-Space>"] = cmp.mapping.complete(),

      -- scroll up and down the documentation window
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),

      -- navigate between snippet placeholders
      ["<C-f>"] = cmp_action.luasnip_jump_forward(),
      ["<C-b>"] = cmp_action.luasnip_jump_backward(),

    }),
    -- note: if you are going to use lsp-kind (another plugin)
    -- replace the line below with the function from lsp-kind
    formatting = cmp_format,
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  --[[ Eagle ]]
  -- vim.api.nvim_create_autocmd('LspAttach', {
  --   callback = function(event)
  --     -- this is the function that loads the extra snippets
  --     -- from rafamadriz/friendly-snippets
  --     require("eagle").setup({
  --       border = "rounded", -- rounded, single, double, shadow
  --       -- override the default values found in config.lua
  --     })
  --   end,
  -- })
end

return M