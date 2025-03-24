local M = {}

local setup = function()
  -- Enable Lua support for filetype detection
  vim.g.do_filetype_lua = 1

  -- Set command line height to 1
  vim.opt.cmdheight = 1

  ------------------------------------------------------------
  -- Disable certain Vim plugins to improve performance
  ------------------------------------------------------------
  vim.g.loaded_gzip = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1

  ------------------------------------------------------------
  -- Disable Python 2 provider
  ------------------------------------------------------------
  vim.g.loaded_python_provider = 0
  vim.g.python_host_prog = vim.fs.joinpath("bin", "python2")
  vim.g.python3_host_prog = vim.fs.joinpath("bin", "python")
  vim.g.node_host_prog = vim.fs.joinpath("bin", "neovim-node-host")

  ------------------------------------------------------------
  -- Search & Highlighting settings
  ------------------------------------------------------------
  vim.opt.hlsearch = true  -- Highlight all matches of search pattern
  vim.opt.iskeyword = { "@", "48-57", "_", "192-255" }  -- Define what characters are part of a word
  vim.opt.showmatch = true  -- Highlight matching parenthesis or bracket
  vim.opt.matchtime = 2  -- Time for match highlighting (default 5)
  vim.opt.autochdir = true  -- Change working directory to that of the file when opening


  ------------------------------------------------------------
  -- Mouse settings
  ------------------------------------------------------------
  -- Mouse support can be enabled for different modes:
  --  n       Normal mode
  --  v       Visual mode
  --  i       Insert mode
  --  c       Command-line mode
  --  h       all previous modes when editing a help file
  --  a       all previous modes
  --  r       for |hit-enter| and |more-prompt| prompt
  vim.opt.mouse = "nivc"
  vim.o.mousemoveevent = true  -- Enable mouse move events

  ------------------------------------------------------------
  -- Clipboard settings
  ------------------------------------------------------------
  vim.opt.clipboard = "unnamedplus"  -- Use system clipboard

  ------------------------------------------------------------
  -- Indentation and formatting
  ------------------------------------------------------------
  vim.opt.smarttab = true  -- Smart tabbing based on shiftwidth
  vim.opt.shiftround = true  -- Round indentation to the nearest shiftwidth
  vim.opt.textwidth = 100  -- Maximum text width before line breaks
  vim.opt.expandtab = true  -- Convert tabs to spaces
  vim.opt.autoindent = true  -- Auto-indent new lines
  vim.opt.tabstop = 2  -- Number of spaces per tab
  vim.opt.shiftwidth = 2  -- Number of spaces per indentation level
  vim.opt.softtabstop = -1  -- Adjust tab width during editing

  ------------------------------------------------------------
  -- Timeout settings for key mappings
  ------------------------------------------------------------
  vim.opt.timeout = true
  vim.opt.ttimeout = true
  vim.opt.timeoutlen = 500  -- Wait time in ms for key sequences
  vim.opt.ttimeoutlen = 10  -- Time in ms for key code sequence

  ------------------------------------------------------------
  -- Miscellaneous
  ------------------------------------------------------------
  vim.opt.updatetime = 100  -- Update swap file after this time
  vim.opt.ignorecase = true  -- Ignore case when searching
  vim.opt.smartcase = true  -- Case-sensitive search if uppercase is used
  vim.opt.infercase = true  -- Adjust case based on input during completion
  vim.opt.incsearch = true  -- Incremental search while typing
  vim.opt.wrapscan = true  -- Search wraps around the end of the file
  vim.opt.splitbelow = true  -- Split windows below current window
  vim.opt.splitright = true  -- Split windows to the right of current window
  vim.opt.inccommand = "split"  -- Incremental command feedback in split
  vim.opt.joinspaces = false  -- Don't add extra spaces at the end of lines

  ------------------------------------------------------------
  -- Completion and cursor settings
  ------------------------------------------------------------
  vim.opt.completeopt = { "menu", "menuone", "noselect" }  -- Completion options
  vim.opt.whichwrap:append("<,>,[,],~")  -- Allow cursor movement across line ends
  vim.opt.shortmess:remove("I")  -- Don't show intro message
  vim.opt.shortmess:remove("c")  -- Don't show completion menu info
  vim.opt.formatoptions:append("j")  -- Join comments when appropriate
  vim.opt.formatoptions:append("c")  -- Auto-wrap comments
  vim.opt.formatoptions:append("r")  -- Auto-insert comment leader on Enter
  vim.opt.formatoptions:append("o")  -- Auto-insert comment leader on o/O
  vim.opt.formatoptions:append("q")  -- Allow formatting with gq

  ------------------------------------------------------------
  -- File management settings
  ------------------------------------------------------------
  vim.opt.directory = vim.fs.joinpath(vim.fn.stdpath("cache"), "swag")
  vim.opt.undodir = vim.fs.joinpath(vim.fn.stdpath("cache"), "undo")
  vim.opt.backupdir = vim.fs.joinpath(vim.fn.stdpath("cache"), "backup")
  vim.opt.viewdir = vim.fs.joinpath(vim.fn.stdpath("cache"), "view")
  vim.opt.shadafile = vim.fs.joinpath(vim.fn.stdpath("cache"), "shada")
  vim.opt.shada = [[!,'300,<50,@100,s10,h]]  -- Shada settings for persistent state
  vim.opt.filetype = "plugin"
  vim.opt.fsync = true
  vim.opt.backup = false  -- Disable backup files
  vim.opt.writebackup = false
  vim.opt.undofile = true  -- Enable undo files
  vim.opt.swapfile = false  -- Disable swap files
  vim.opt.history = 2000  -- Command history length
  vim.opt.autoread = true  -- Auto-read files that have been changed outside

  ------------------------------------------------------------
  -- Backup exclusions
  ------------------------------------------------------------
  vim.opt.backupskip = { "/tmp/*", "$TMPDIR/*", "$TMP/*", "$TEMP/*", "*/shm/*", "/private/var/*", ".vault.vim" }

  ------------------------------------------------------------
  -- Window and UI settings
  ------------------------------------------------------------
  vim.opt.title = true  -- Enable window title
  vim.opt.titlestring = "%<%F%=%l/%L - nvim"  -- Format of the title string
  vim.opt.background = "dark"  -- Set background for dark theme
  vim.opt.guifont = "Lilex Nerd Font:h10"  -- GUI font for Neovim
  vim.opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]  -- Cursor shape settings
  vim.opt.termguicolors = true  -- Enable true color support
  vim.opt.errorbells = false  -- Disable error bell
  vim.opt.visualbell = false  -- Disable visual bell
  vim.opt.redrawtime = 1500  -- Time before screen is redrawn
  vim.opt.signcolumn = "number"  -- Show line numbers in the sign column
  vim.opt.showtabline = 1  -- Show tabline when there is more than one tab
  vim.opt.winwidth = 30  -- Minimum width of a window
  vim.opt.winminwidth = 10  -- Minimum width of a window when split
  vim.opt.pumheight = 15  -- Height of popup menus
  vim.opt.helpheight = 12  -- Height of the help window
  vim.opt.previewheight = 12  -- Height of preview window
  vim.opt.showcmd = true  -- Show command input in the last line
  vim.opt.cmdheight = 1  -- Height of the command-line
  vim.opt.cmdwinheight = 5  -- Height of command-line window
  vim.opt.equalalways = false  -- Don't automatically equalize window sizes
  vim.opt.laststatus = 3  -- Only show status line for the last window
  vim.opt.display = "lastline"  -- Display only last line
  vim.opt.cursorline = false  -- Disable cursor line highlighting
  vim.opt.cursorlineopt = "number"  -- Highlight cursor line with line number
  vim.opt.numberwidth = 4  -- Width of line number column
  vim.opt.number = true  -- Display line numbers
  vim.opt.showmode = false  -- Hide the mode indicator (e.g., -- INSERT --)
  vim.opt.scrolloff = 2  -- Lines to keep above and below the cursor
  vim.opt.sidescrolloff = 5  -- Lines to keep left and right of the cursor

  ------------------------------------------------------------
  -- Syntax
  ------------------------------------------------------------
  vim.opt.hidden = true  -- Keep buffers open in the background
  vim.opt.magic = true  -- Enable magic characters in patterns
  vim.opt.virtualedit = "block"  -- Allow virtual editing in Visual block mode
  vim.opt.viewoptions = { "folds", "cursor", "curdir" }
  vim.opt.sessionoptions = { "curdir", "help", "tabpages", "winsize" }
  vim.opt.wildignorecase = true  -- Ignore case in filename completion
  vim.opt.wildignore = { "*.pyc", "*.o", "*.out", "*.jpg", "*.jpeg", "*.png", "*.gif", "*.zip", "**/tmp/**", "*.DS_Store", "**/node_modules/**", "**/bower_modules/**" }

  ------------------------------------------------------------
  -- Completion options
  ------------------------------------------------------------
  vim.opt.complete = { ".", "w", "b", "k" }  -- Completion sources
  vim.opt.grepformat = "%f:%l:%c:%m"  -- Grep output format
  vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"  -- Use ripgrep for search

  ------------------------------------------------------------
  -- Buffer settings
  ------------------------------------------------------------
  vim.opt.startofline = false  -- Don't move cursor to the first non-blank of the line
  vim.opt.switchbuf = "useopen"  -- Switch to open buffer if possible
  vim.opt.backspace = { "indent", "eol", "start" }  -- Backspace behavior
  vim.opt.diffopt = { "filler", "iwhite", "internal", "algorithm:patience" }  -- Diff settings

  ------------------------------------------------------------
  -- Folding settings
  ------------------------------------------------------------
  vim.opt.foldlevelstart = 99  -- Set initial fold level
  vim.opt.foldmethod = "expr"  -- Use Treesitter for folding
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"  -- Folding expression for Treesitter

  ------------------------------------------------------------
  -- Wrap and line break settings
  ------------------------------------------------------------
  vim.opt.ruler = true  -- Show cursor position
  vim.opt.wrap = false  -- Disable line wrapping
  vim.opt.synmaxcol = 500  -- Max column to search for syntax
  vim.opt.linebreak = false  -- Disable line break at word boundaries
  vim.opt.breakat = [[\ \ ;:,!?]]  -- Characters where a line may break
  vim.opt.breakindentopt = { shift = 2, min = 20 }  -- Break indent behavior

  ------------------------------------------------------------
  -- List and fill characters
  ------------------------------------------------------------
  vim.opt.list = true
  vim.opt.listchars = {
    -- eol = "↲",
    tab = "⎵/",
    nbsp = "+",
    trail = "·",
    extends = "→",
    precedes = "←",
    -- space = "·",
  }
  vim.opt.fillchars = {
    --    item            default         Used for ~
    stl = " ", -- " " or "^" statusline of the current window
    stlnc = " ", -- " " or "=" statusline of the non-current windows
    horiz = "─", -- "─" or "-" horizontal separators |:split|
    horizup = "┴", -- "┴" or "-" upwards facing horizontal separator
    horizdown = "┬", -- "┬" or "-" downwards facing horizontal separator
    vert = "│", -- "│" or "|" vertical separators |:vsplit|
    vertleft = "┤", -- "┤" or "|" left facing vertical separator
    vertright = "├", -- "├" or "|" right facing vertical separator
    verthoriz = "┼", -- "┼" or "+" overlapping vertical and horizontal separator
    fold = "-", -- "·" or "-" filling "foldtext"
    foldopen = "-", -- "-" mark the beginning of a fold
    foldclose = "+", -- "+" show a closed fold
    foldsep = "│", -- "│" or "|" open fold middle marker
    diff = "-", -- "-" deleted lines of the "diff" option
    msgsep = " ", -- " " message separator "display"
    eob = " ", -- "~" empty lines at the end of a buffer
  }
  ------------------------------------------------------------
  -- Mouse Context Menu
  ------------------------------------------------------------

  vim.cmd.aunmenu([[PopUp.How-to\ disable\ mouse]])
  vim.cmd.amenu([[PopUp.:Inspect <Cmd>Inspect<CR>]])
  vim.cmd.amenu([[PopUp.:Telescope <Cmd>Telescope<CR>]])
  vim.cmd.amenu([[PopUp.Code\ action <Cmd>lua vim.lsp.buf.code_action()<CR>]])
  vim.cmd.amenu([[PopUp.LSP\ Hover <Cmd>lua vim.lsp.buf.hover()<CR>]])

  vim.paste = (function(overridden)
    return function(lines, phase)
      for i, line in ipairs(lines) do
        -- Scrub ANSI color codes from paste input.
        lines[i] = line:gsub('\27%[[0-9;mK]+', '')
      end
      overridden(lines, phase)
    end
  end)(vim.paste)
end


return setmetatable(M, {
  __call = function()
    -- Setyp function
    setup()
  end
})
