local M = {}

local map = vim.keymap.set

M.leader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    map({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.mapleader = c
end

M.localleader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    map({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.maplocalleader = c
end

local general = function(wk)
  --> Small fixes <--
  map({ "n" }, "<esc>", ":noh<cr>", { desc = "Remove search highlights in normal mode" })
  map({ "n", "x" }, "<space>", "<nop>", { desc = "Dont move cursor on space" })
  --> indentation <--
  map({ "v" }, "<", "<gv", { desc = "Indent left" })
  map({ "v" }, ">", ">gv", { desc = "Indent right" })
  map({ "n" }, "<tab>", ">>_", { desc = "Indent left" })
  map({ "n" }, "<s-tab>", "<<_", { desc = "Indent right" })
  map({ "i" }, "<s-tab>", "<c-d>", { desc = "Indent right" })
  map({ "v" }, "<tab>", ">gv", { desc = "Indent left" })
  map({ "v" }, "<s-tab>", "<gv", { desc = "Indent right" })
  --> move lines <--
  map({ "n" }, "<a-j>", ":m .+1<cr>==", { desc = "Move line down" })
  map({ "n" }, "<a-k>", ":m .-2<cr>==", { desc = "Move line up" })
  map({ "v" }, "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
  map({ "v" }, "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
  map({ "x" }, "<a-j>", ":m '>+1<cr>gv-gv", { desc = "Move line down" })
  map({ "x" }, "<a-k>", ":m '<-2<cr>gv-gv", { desc = "Move line up" })
  --> move between windows <--
  map({ "n" }, "<c-h>", ":SmartCursorMoveLeft<cr>", { desc = "Move to left window", noremap = true, silent = true })
  map({ "n" }, "<c-j>", ":SmartCursorMoveDown<cr>", { desc = "Move to bottom window", noremap = true, silent = true  })
  map({ "n" }, "<c-k>", ":SmartCursorMoveUp<cr>", { desc = "Move to top window", noremap = true, silent = true  })
  map({ "n" }, "<c-l>", ":SmartCursorMoveRight<cr>", { desc = "Move to right window", noremap = true, silent = true  })
  --> move between tabs <--
  map({ "n" }, "<a-h>", ":tabprevious<cr>", { desc = "Move to left tab" })
  map({ "n" }, "<a-l>", ":tabnext<cr>", { desc = "Move to right tab" })

  -- --> terminal mode <--
  -- map({ "n" }, "<c-t>", ":ToggleTerm<cr>", { desc = "Toggle Terminal" })
  -- map({ "t" }, "<c-t>", "<C-\\><C-N>:ToggleTerm<cr>", { desc = "Toggle Terminal" })
  -- -- map({ "n" }, "<c-t>", ":Lspsaga term_toggle<cr>", { desc = "Toggle Terminal" })
  -- map({ "n" }, "<esc>", "<C-\\><C-N>", { desc = "Escape Terminal" })
  -- map({ "t" }, "<esc>", "<C-\\><C-N><C-w>h", { desc = "Move to left window" })
  -- map({ "t" }, "<esc>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom window" })
  -- map({ "t" }, "<esc>", "<C-\\><C-N><C-w>k", { desc = "Move to top window" })
  -- map({ "t" }, "<esc>", "<C-\\><C-N><C-w>l", { desc = "Move to right window" })
  --> command mode <--
  map({ "c" }, "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true, desc = "Search command history" })
  map({ "c" }, "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true, desc = "Move to next item" })
  map({ "c" }, "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true, desc = "Move to previous item" })
end

local top_level = function(wk)
  --> top-level leader <--
  map({ "n" }, "<leader>e", ":Neotree filesystem toggle<cr>", { desc = "NeoTree" })
  wk.add({ "<leader>e", icon = { icon = "", color = "green", cat = "filetype" } })
  map({ "n" }, "<leader>h", ":HopWord<cr>", { desc = "Hop!" })
  wk.add({ "<leader>h", icon = { icon = "󰑮", color = "blue", cat = "extension" } })
  map({ "n" }, "<leader>Q", ":qa!<cr>", { desc = "Quit" })
  -- map({ "n" }, "<leader>A", ":Alpha<cr>", { desc = "Alpha" })
  -- wk.add({ "<leader>A", icon = { icon = "󰕮", color = "azure", cat = "filetype" } })
  -- map({ "n" }, "<leader>A", ":Alpha<cr>", { desc = "Alpha" }, { icon = "󰕮", color = "azure", cat = "filetype" })
  --> Lazy.nvim <--
  map({ "n" }, "<leader>Z", ":Lazy<cr>", { desc = "Lazy" })
end

local buffers = function(wk)
  map({ "n" }, "<leader>b", "Buffer", { desc = "Buffer" })
  map({ "n" }, "<leader>bs", ":Neotree buffers toggle<cr>", { desc = "Show open buffers" })
  map({ "n" }, "<leader>bh", ":new<cr>", { desc = "Horizonal split" })
  map({ "n" }, "<leader>bv", ":vnew<cr>", { desc = "Vertical split" })
  map({ "n" }, "<leader>bC", ":BufferCloseAllButCurrent<cr>", { desc = "Close all but current" })
  map({ "n" }, "<leader>bd", ":BufferClose<cr>", { desc = "Close buffer" })
  map({ "n" }, "<leader>bn", ":BufferNext<cr>", { desc = "Next buffer" })
  map({ "n" }, "<leader>bp", ":BufferPick<cr>", { desc = "Pick buffer" })
end

local treesiter = function(wk)
  --[[
    TSBufDisable
    TSInstallSync
    TSInstallInfo
    TSInstallFromGrammar
    TSModuleInfo
    TSUninstall
    TSToggle
    TSUpdate
    TSUpdateSync
    TSInstall
    TSEditQueryUserAfter
    TSBufToggle
    TSBufEnable
    TSEnable
    TSConfigInfo
    TSEditQuery
    TSDisable
  ]]
  map({ "n" }, "<leader>T", "Treesitter", { desc = "Treesitter" })
  wk.add({ "<leader>T", icon = { icon = "", color = "green", cat = "filetype" } })
  map({ "n" }, "<leader>Ti", ":TSInstall<cr>", { desc = "Install" })
  map({ "n" }, "<leader>Tu", ":TSUpdate<cr>", { desc = "Update" })
  map({ "n" }, "<leader>TU", ":TSUpdateSync<cr>", { desc = "Update Sync" })
  map({ "n" }, "<leader>TS", ":TSInstallSync<cr>", { desc = "Install Sync" })
  map({ "n" }, "<leader>TI", ":TSInstallInfo<cr>", { desc = "Install Info" })
  map({ "n" }, "<leader>TF", ":TSInstallFromGrammar<cr>", { desc = "Install From Grammar" })
  map({ "n" }, "<leader>TM", ":TSModuleInfo<cr>", { desc = "Module Info" })
  -- map({ "n" }, "TU", ":TSUninstall<cr>", { desc = "Uninstall" })
  map({ "n" }, "<leader>TT", ":TSToggle<cr>", { desc = "Toggle" })
  map({ "n" }, "<leader>TE", ":TSEditQuery<cr>", { desc = "Edit Query" })

end

local git = function(wk)
  vim.keymap.set({ "n" }, "<leader>g", "Git", { desc = "Git" })
  vim.keymap.set({ "n" }, "<leader>gg", ":Neogit<cr>", { desc = "Neogit" })
  vim.keymap.set({ "n" }, "<leader>gn", ":Neotree git_status toggle<CR>", { desc = "Neotree git status" })
  vim.keymap.set({ "n" }, "<leader>gj", ":lua require 'gitsigns'.next_hunk()<CR>", { desc = "Next Hunk" })
  vim.keymap.set({ "n" }, "<leader>gk", ":lua require 'gitsigns'.prev_hunk()<CR>", { desc = "Prev Hunk" })
  vim.keymap.set({ "n" }, "<leader>gl", ":lua require 'gitsigns'.blame_line()<CR>", { desc = "Blame" })
  vim.keymap.set({ "n" }, "<leader>gp", ":lua require 'gitsigns'.preview_hunk()<CR>", { desc = "Preview Hunk" })
  vim.keymap.set({ "n" }, "<leader>gr", ":lua require 'gitsigns'.reset_hunk()<CR>", { desc = "Reset Hunk" })
  vim.keymap.set({ "n" }, "<leader>gR", ":lua require 'gitsigns'.reset_buffer()<CR>", { desc = "Reset Buffer" })
  vim.keymap.set({ "n" }, "<leader>gs", ":lua require 'gitsigns'.stage_hunk()<CR>", { desc = "Stage Hunk" })
  vim.keymap.set({ "n" }, "<leader>gu", ":lua require 'gitsigns'.undo_stage_hunk()<CR>", { desc = "Undo Stage Hunk" })
  vim.keymap.set({ "n" }, "<leader>go", ":Telescope git_status<CR>", { desc = "Open changed file" })
  vim.keymap.set({ "n" }, "<leader>gb", ":Telescope git_branches<CR>", { desc = "Checkout branch" })
  vim.keymap.set({ "n" }, "<leader>gc", ":Telescope git_commits<CR>", { desc = "Checkout commit" })
  vim.keymap.set({ "n" }, "<leader>gC", ":Telescope git_bcommits<CR>", { desc = "Checkout commit(for current file)" })
  vim.keymap.set({ "n" }, "<leader>gd", ":Gitsigns diffthis HEAD<CR>", { desc = "Git Diff" })
end


local telescope = function()
  vim.keymap.set("n", "<leader>S", "Telescope", { desc = "Telescope" })
  --[[ Temporarily Writing out the pickers
  autocommands
  builtin
  colorscheme
  command_history
  commands
  current_buffer_fuzzy_find
  current_buffer_tags
  diagnostics
  fd
  filetypes
  find_files
  git_bcommits
  git_branches
  git_commits
  git_files
  git_stash
  git_status
  grep_string
  help_tags
  highlights
  jumplist
  keymaps
  live_grep
  loclist
  lsp_definitions
  lsp_document_symbols
  lsp_dynamic_workspace_symbols
  lsp_implementations
  lsp_incoming_calls
  lsp_outgoing_calls
  lsp_references
  lsp_type_definitions
  lsp_workspace_symbols
  man_pages
  marks
  oldfiles
  pickers
  planets
  quickfix
  quickfixhistory
  registers
  reloader
  resume
  search_history
  spell_suggest
  symbols
  tags
  tagstack
  treesitter
  vim_options
  ]]
  -- vim.keymap.set("n", "<leader>Sp", ":Telescope<cr>", { desc = "Pickers" })
  vim.keymap.set({ "n" }, "<leader>S", "Telescope", { desc = "Telescope" })
  vim.keymap.set({ "n" }, "<leader>S?", ":Telescope<cr>", { desc = "Telescope builtins" })
  vim.keymap.set("n", "<leader>Se", function()
    require("telescope").extensions.file_browser.file_browser()
  end, { desc = "Open file browser" })
  vim.keymap.set({ "n" }, "<leader>SF", ":Telescope frecency<cr>", { desc = "Frecency" })
  vim.keymap.set({ "n" }, "<leader>SB", ":Telescope buffers<cr>", { desc = "Buffers" })
  vim.keymap.set({ "n" }, "<leader>SN", ":Telescope notify<cr>", { desc = "Notify" })
  vim.keymap.set({ "n" }, "<leader>Sb", ":Telescope git_branches<CR>", { desc = "Checkout branch" })
  vim.keymap.set({ "n" }, "<leader>Sc", ":Telescope colorscheme<CR>", { desc = "Colorscheme" })
  vim.keymap.set({ "n" }, "<leader>Sf", ":Telescope fd<CR>", { desc = "Find File" })
  vim.keymap.set({ "n" }, "<leader>Sh", ":Telescope help_tags<CR>", { desc = "Find Help" })
  vim.keymap.set({ "n" }, "<leader>SM", ":Telescope man_pages<cr>", { desc = "Man Pages"})
  vim.keymap.set({ "n" }, "<leader>Sm", ":Telescope oldfiles<cr>", { desc = "Old files" })
  vim.keymap.set({ "n" }, "<leader>Sr", ":Telescope registers<cr>", { desc = "Registers" })
  vim.keymap.set({ "n" }, "<leader>St", ":Telescope live_grep<cr>", { desc = "Text" })
  vim.keymap.set({ "n" }, "<leader>Sk", ":Telescope keymaps<cr>", { desc = "Keymaps" })
  vim.keymap.set({ "n" }, "<leader>SC", ":Telescope commands<cr>", { desc = "Commands" })
  vim.keymap.set({ "n" }, "<leader>SL", ":Telescope loclist<cr>", { desc = "Loclist" })
  vim.keymap.set({ "n" }, "<leader>SM", ":Telescope marks<cr>", { desc = "Marks" })
  vim.keymap.set({ "n" }, "<leader>SS", ":Telescope spell_suggest<cr>", { desc = "Spell Suggest" })
end

local fzf = function(wk)
  vim.keymap.set("n", "<leader>F", ":FzfLua<cr>", { desc = "fzf" })
end

local lsp = function(wk)
  vim.keymap.set({ "n" }, "<leader>L", "Language Server Protocol", { desc = "LSP" })
  -- vim.keymap.set({ "n" }, "<leader>Ll", "Servers", { desc = "Servers" })
  vim.keymap.set({ "n" }, "<leader>Ll", ":LspLog<cr>", { desc = "Log" })
  vim.keymap.set({ "n" }, "<leader>Li", ":LspInfo<cr>", { desc = "Info" })
  vim.keymap.set({ "n" }, "<leader>LR", ":LspRestart<cr>", { desc = "Restart" })
  vim.keymap.set({ "n" }, "<leader>LS", "LspSaga", { desc = "LspSaga" })
  vim.keymap.set({ "n" }, "<leader>LSa", ":Lspsaga code_action<cr>", { desc = "Code Action" })
  vim.keymap.set({ "n" }, "<leader>LSd", ":Lspsaga hover_doc<cr>", { desc = "Hover Doc" })
  vim.keymap.set({ "n" }, "<leader>LSf", ":Lspsaga finder<cr>", { desc = "Lsp Finder" })
  vim.keymap.set({ "n" }, "<leader>LSo", ":Lspsaga outline<cr>", { desc = "Open Terminal" })
  vim.keymap.set({ "n" }, "<leader>LSr", ":Lspsaga rename<cr>", { desc = "Rename" })
  vim.keymap.set({ "n" }, "<leader>LSp", ":Lspsaga peek_definition<cr>", { desc = "Peek" })
  vim.keymap.set({ "n" }, "<leader>LZ", ":LspZeroViewConfigSource<cr>", { desc = "Lsp Zero View Config Source" })
  vim.keymap.set({ "n" }, "<leader>Lz", ":LspZeroSetupServers<cr>", { desc = "Lsp Zero Setup Servers" })
  -- vim.keymap.set({ "n" }, "<leader>lC", ":CopilotPanel<cr>", { desc = "Copilot Panel" })
  vim.keymap.set({ "n" }, "<leader>Ls", ":Telescope lsp_document_symbols<cr>", { desc = "Find" })
  vim.keymap.set({ "n" }, "<leader>Lw", ":Telescope lsp_workspace_symbols<cr>", { desc = "Find" })
  vim.keymap.set({ "n" }, "<leader>Lr", ":Telescope lsp_references<cr>", { desc = "References" })
  vim.keymap.set({ "n" }, "<leader>Ld", ":Telescope lsp_definitions<cr>", { desc = "Definitions" })
  vim.keymap.set({ "n" }, "<leader>Li", ":Telescope lsp_implementations<cr>", { desc = "Implementations" })
  vim.keymap.set({ "n" }, "<leader>Lf", ":lua vim.lsp.buf.format()<cr>", { desc = "Format" })
  vim.keymap.set({ "n" }, "<leader>LM", "Mason", { desc = "Mason" })
  vim.keymap.set({ "n" }, "<leader>LMm", ":Mason<cr>", { desc = "Open" })
  vim.keymap.set({ "n" }, "<leader>LMu", ":MasonUpdate<cr>", { desc = "Reload" })
  vim.keymap.set({ "n" }, "<leader>LML", ":MasonLog<cr>", { desc = "Log" })
end
local lspattach = function(wk)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      --print(vim.inspect(event))
      -- ADD LSPUI keymaps
      -- default keys (don't use): g -> [e, f, g, i, n, N, t, T, u, U, v, w, x, %, ,, ;, ~, c, ', `]
      map({ "n" }, "gl", "LSP", { desc = "LSP" })
      map({ "n" }, "glK", ":lua vim.lsp.buf.hover()<cr>", { desc = "Show hover information", buffer = event.buf })
      map({ "n" }, "gld", ":lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition", buffer = event.buf })
      map({ "n" }, "glD", ":lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration", buffer = event.buf })
      map({ "n" }, "gli", ":lua vim.lsp.buf.implementation()<cr>", { desc = "Go to implementation", buffer = event.buf })
      map({ "n" }, "glt", ":lua vim.lsp.buf.type_definition()<cr>", { desc = "Go to type definition", buffer = event.buf })
      map({ "n" }, "glR", ":lua vim.lsp.buf.references()<cr>", { desc = "Show references", buffer = event.buf })
      map({ "n" }, "glk", ":lua vim.lsp.buf.signature_help()<cr>", { desc = "Show signature help", buffer = event.buf })
      map({ "n" }, "glr", ":lua vim.lsp.buf.rename()<cr>", { desc = "Rename", buffer = event.buf })
      map({ "n", "x" }, "glF", ":lua vim.lsp.buf.format({async = true})<cr>", { desc = "Format", buffer = event.buf })
      map({ "n" }, "glA", ":lua vim.lsp.buf.code_action()<cr>", { desc = "Code action", buffer = event.buf })

      map({ "n" }, "gdn", ":lua vim.diagnostic.goto_prev()<cr>", { desc = "LSP Goto Previous", buffer = event.buf })
      map({ "n" }, "gdp", ":lua vim.diagnostic.goto_next()<cr>", { desc = "LSP Goto Next", buffer = event.buf })


      -- map({ "n" }, "gh", ":Lspsaga finder<cr>", { desc = "LspSaga Finder" })
      -- map({ "n" }, "gp", ":Lspsaga peek_definition<cr>", { desc = "LspSaga Peek", silent = true })
      -- map({ "n" }, "gr", ":Lspsaga rename<cr>", { desc = "LspSaga Rename" })
      -- map({ "n" }, "gs", ":Lspsaga signature_help<cr>", { desc = "LspSaga Signature Help" })

      -- -- map({ "n" }, "gc", ":Lspsaga code_action<cr>", { desc = "LspSaga Code Action" })
      -- map({ "n" }, "<leader>LSd", ":Lspsaga hover_doc<cr>", { desc = "LspSaga Hover Doc" })
      -- map({ "n" }, "<leader>LSo", ":Lspsaga outline<cr>", { desc = "LspSaga Toggle Outline" })

    end,
  })
end


local context_menu = function()
  -- Keyboard users
  vim.keymap.set("n", "<C-t>", function()
    require("menu").open("default")
  end, {})

  -- mouse users + nvimtree users!
  vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
    require('menu.utils').delete_old_menus()

    vim.cmd.exec '"normal! \\<RightMouse>"'

    -- clicked buf
    local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
    local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

    require("menu").open(options, { mouse = true })
  end, {})
end

return setmetatable(M, {
  __call = function()
    local wk = require("which-key")
    --> general <--
    general(wk)
    --> top-level leader <--
    top_level(wk)
    --> Buffers <--
    buffers(wk)
    --> Treesitter <--
    treesiter(wk)
    --> LSP Attach <--
    lspattach(wk)
    --> Context Menu <--
    context_menu()
  end
})
