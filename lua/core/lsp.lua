local M = {}

local function get_cmp()
  local ok_cmp, cmp = pcall(require, "cmp")
  return ok_cmp and cmp or {}
end

local lsp = function()
  local ok = false
  local cmp_nvim_lsp = nil
  ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not ok then
    vim.notify("nvim-cmp-lsp is not installed")
    return
  end

  local lspconfig = nil
  ok, lspconfig = pcall(require, "lspconfig")
  if not ok then
    vim.notify("lspconfig is not installed")
    return
  end

  -- Extend default config with nvim_cmp_lsp capabilities
  lspconfig.util.default_config = vim.tbl_deep_extend(
    "force",
    lspconfig.util.default_config,
    {
      sign_text = true,
      float_border = "rounded",
      -- lsp_attach = function(client, buf)
        -- keymaps.lsp_attach(client, buf)
      -- end,
      capabilities = cmp_nvim_lsp.default_capabilities()
    }
  )

  -- Setup Diagnostics
  -- vim.diagnostic.config({
  --   virtual_text = false,
  --   signs = true,
  --   underline = true,
  --   update_in_insert = false,
  --   severity_sort = false,
  -- })
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true },
    signs = true,
    float = {
      border = 'single',
      format = function(d) return ('%s (%s) [%s]'):format(d.message, d.source, d.code or d.user_data.lsp.code) end,
    },
  })




  -- Define Diagnostic Signs
  local diagnostic_signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignInfo", text = " " },
    { name = "DiagnosticSignHint", text = "󰌵" },
  }
  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name })
  end

  -- -- Setup Mason
  local mason = nil
  ok, mason = pcall(require, "mason")
  if not ok then
    vim.notify("mason is not installed")
    return
  end
  mason.setup({})
  local mason_lspconfig = nil
  ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not ok then
    vim.notify("mason-lspconfig is not installed")
    return
  end
  mason_lspconfig.setup({
    ensure_installed = {},
    handlers = {
      -- this first function is the "default handler"
      -- it applies to every language server without a "custom handler"
      function(server)
        local path = vim.fs.joinpath(
          vim.fn.stdpath("config"),
          "lua",
          "core",
          "servers",
          server .. ".lua"
        )
        if not (vim.loop.fs_stat(path) or vim.uv.fs_stat(path)) then
          -- vim.notify("Server " .. server .. " is not custom configured")
          lspconfig[server].setup({})
        else
          require("core.servers." .. server)(lspconfig)
        end
      end,
    }
  })
end

local linters = function()
  local null_ls = require("null-ls")
  -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
  null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,

        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.code_actions.gitsigns,
        -- null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.zsh,
        null_ls.builtins.formatting.alejandra,
        null_ls.builtins.formatting.just,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.typstyle,
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    },
})
end

local completion = function()
  local ok, cmp = pcall(require, "cmp")
  if not ok then
    vim.notify("nvim-cmp is not installed")
    return
  end
  local luasnip = require("luasnip")
  local comparator = require("cmp-under-comparator")
  local lspkind = require("lspkind")

  -- this is the function that loads the extra snippets
  -- from rafamadriz/friendly-snippets
  require("luasnip.loaders.from_vscode").lazy_load()


  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  -- Completion
  cmp.setup({
    experimental = {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    },
    completion = {
      completeopt = "menu,menuone,noinsert,noselect",
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
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      -- confirm completion item
      -- ["<Enter>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),

      -- trigger completion menu
      ["<C-Space>"] = cmp.mapping.complete(),

      -- scroll up and down the documentation window
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),

      -- navigate between snippet placeholders
      -- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
      -- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
      -- navigate between snippet placeholders
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    }),
    sources = {
      -- Copilot Source
      { name = "copilot", group_index = 2 },
      -- Other Sources
      { name = "nvim_lsp", group_index = 2 },
      { name = "path", group_index = 2 },
      { name = "luasnip", group_index = 2 },
      { name = "buffer", group_index = 2 },
      { name = "cmdline", group_index = 2 },
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol", -- show only symbol annotations
        maxwidth = {
          -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
          -- menu = function() return math.floor(0.45 * vim.o.columns) end,
          menu = 50, -- leading text (labelDetails)
          abbr = 50, -- actual suggestion item
        },
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function (entry, vim_item)
          -- ...
          return vim_item
        end
      }),
    },
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

end

return setmetatable(M, {
  __call = function()
    lsp()
    completion()
    linters()
  end
})
