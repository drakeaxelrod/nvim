return {
  "ojroques/nvim-lspfuzzy",
  enabled = false,
  dependencies = {
    { "junegunn/fzf" },
    { "junegunn/fzf.vim" },  -- to enable preview (optional)
  },
  opts = {
    methods = "all",         -- either "all" or a list of LSP methods (see below)
    jump_one = true,         -- jump immediately if there is only one location
    save_last = false,       -- save last location results for the :LspFuzzyLast command
    callback = nil,          -- callback called after jumping to a location
    fzf_preview = {          -- arguments to the FZF "--preview-window" option
      "right:+{2}-/2"          -- preview on the right and centered on entry
    },
    fzf_action = {               -- FZF actions
      ["ctrl-t"] = "tab split",  -- go to location in a new tab
      ["ctrl-v"] = "vsplit",     -- go to location in a vertical split
      ["ctrl-x"] = "split",      -- go to location in a horizontal split
    },
    fzf_modifier = ":~:.",   -- format FZF entries, see |filename-modifiers|
    fzf_trim = true,         -- trim FZF entries
  },
}
