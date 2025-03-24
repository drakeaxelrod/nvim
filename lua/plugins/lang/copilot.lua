return {
  "zbirenbaum/copilot-cmp",
  event = { "LspAttach" },
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "LspAttach",
      opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
      },
    },
  },
  opts = function(LazyPlugin, opts)
    return opts
  end,
}

