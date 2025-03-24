-- Although many packages are perfectly usable out of the box through Neovim builtins, it is recommended to use other 3rd party plugins to further integrate these. The following plugins are recommended:

-- LSP: lspconfig & mason-lspconfig.nvim
-- DAP: nvim-dap & nvim-dap-ui
-- Linters: null-ls.nvim or nvim-lint
-- Formatters: null-ls.nvim or formatter.nvim


  -- LSP
  -- { "VonHeikemen/lsp-zero.nvim" },
  -- { "williamboman/mason.nvim" },
  -- { "williamboman/mason-lspconfig.nvim" },
  -- { "neovim/nvim-lspconfig" },

  -- -- Completion
  -- { "hrsh7th/nvim-cmp" },
  -- { "hrsh7th/cmp-nvim-lsp" }, -- nvim-cmp source for neovim's built-in language server client.



  -- { "nvimtools/none-ls.nvim" },
  -- { "mfussenegger/nvim-dap" },
  -- { "hrsh7th/nvim-cmp" },
  -- { "hrsh7th/cmp-nvim-lsp" },
  -- { "hrsh7th/cmp-buffer" },
  -- { "hrsh7th/cmp-path" },
  -- { "hrsh7th/cmp-cmdline" },
  -- { "L3MON4D3/LuaSnip" },
  -- { "saadparwaiz1/cmp_luasnip" },
  -- { "rafamadriz/friendly-snippets" },
  -- { "lukas-reineke/cmp-under-comparator" },

  -- -- Better Diagnostic Virtual Text
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   config = function()
  --     require("lsp_lines").setup()
  --   end,
  -- },

return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "nvimtools/none-ls.nvim" },
  { "mfussenegger/nvim-dap" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  { "lukas-reineke/cmp-under-comparator" },
  { "onsails/lspkind.nvim" },
  {
    "jinzhongjia/LspUI.nvim",
    enabled = false,
    event = "LspAttach",
    branch = "main",
    opts = {},
  }
}

