return function(lspconfig)
  lspconfig.bashls.setup({
    filetypes = { "sh", "zsh" },
  })
end