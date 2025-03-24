local M = {}

------------------------------------------------------------
-- Options
------------------------------------------------------------
M.options = function()
  vim.g.do_filetype_lua = 1
  vim.opt.cmdheight = 1
  -- vim.pretty_print(lvim.builtin)

  vim.g.loaded_gzip = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  -- getscript
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_2html_plugin = 1
  -- matchit
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  --- netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1
  -- dont use python2
  vim.g.loaded_python_provider = 0
  vim.g.python_host_prog = "/bin/python2"
  vim.g.python3_host_prog = "/bin/python"
  vim.g.node_host_prog = "/bin/neovim-node-host"

  vim.opt.hlsearch = true -- highlight all matches on previous search pattern
  -- vim.opt.iskeyword = "@,48-57,_,192-255" -- Keywords are used in searching and recognizing with many commands: "w", "*", "[i", etc.
  vim.opt.iskeyword = { "@", "48-57", "_", "192-255" }
  vim.opt.showmatch = true -- jump to correspond brace for matchtime
  vim.opt.matchtime = 2    -- default 5
  vim.opt.autochdir = true -- When on, Vim will change the current working directory whenever you open a file, switch buffers, delete a buffer or open/close a window.
  vim.opt.mouse = "nivc"
  vim.o.mousemoveevent = true
  -- Mouse support can be enabled for different modes:
  --  n       Normal mode
  --  v       Visual mode
  --  i       Insert mode
  --  c       Command-line mode
  --  h       all previous modes when editing a help file
  --  a       all previous modes
  --  r       for |hit-enter| and |more-prompt| prompt
  vim.opt.clipboard = "unnamedplus"                       -- allows neovim to access the system clipboard
  vim.opt.smarttab = true                                 -- When on, a <Tab> in front of a line inserts blanks according to "shiftwidth".
  vim.opt.shiftround = true                               -- Round indent to multiple of "shiftwidth".
  vim.opt.textwidth = 100                                 -- Maximum width of text that is being inserted.  A longer line will be broken after white space to get this width.
  vim.opt.expandtab = true                                -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
  vim.opt.autoindent = true                               -- Copy indent from current line when starting a new line (typing <CR> in Insert mode or when using the "o" or "O" command).
  vim.opt.tabstop = 2                                     -- Number of spaces that a <Tab> in the file counts for.
  vim.opt.shiftwidth = 2                                  --  Returns the effective value of "shiftwidth". This is the "shiftwidth" value unless it is zero
  vim.opt.softtabstop = -1                                -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
  vim.opt.timeout = true                                  -- This option and "timeoutlen" determine the behavior when part of a mapped key sequence has been received.
  vim.opt.ttimeout = true
  vim.opt.timeoutlen = 500                                -- time in ms to wait for mapped sequence to complete
  vim.opt.ttimeoutlen = 10                                -- time in ms to wait for a key code sequence to complete
  vim.opt.updatetime = 100                                -- if in this ms nothing writtin swap is written to disk
  vim.opt.ignorecase = true                               -- ignore case in search patterns
  vim.opt.smartcase = true                                -- smart case
  vim.opt.infercase = true                                -- When doing keyword completion in insert mode |ins-completion|, and "ignorecase" is also on, the case of the match is adjusted depending on the typed text.
  vim.opt.incsearch = true                                -- While typing a search command, show where the pattern, as it was typed so far, matches.
  vim.opt.wrapscan = true                                 -- Searches wrap around the end of the file.
  vim.opt.splitbelow = true                               -- When on, splitting a window will put the new window below the current one.
  vim.opt.splitright = true                               -- When on, splitting a window will put the new window right of the current one.
  vim.opt.inccommand = "split"                            -- nosplit Shows the effects of a command incrementally in the buffer.
  -- Like "nosplit", but also shows partial off-screen results in a preview window.
  vim.opt.joinspaces = false                              -- dont add spaces to end of lines
  vim.opt.completeopt = { "menu", "menuone", "noselect" } -- A comma-separated list of options for Insert mode completion |ins-completion|.  The supported values are:

  -- Allow specified keys that move the cursor left/right to move to the previous/next
  -- vim.opt.whichwrap:append("h") -- not recommended
  -- vim.opt.whichwrap:append("l") -- not recommended
  vim.opt.whichwrap:append("<")
  vim.opt.whichwrap:append(">")
  vim.opt.whichwrap:append("[")
  vim.opt.whichwrap:append("]")
  vim.opt.whichwrap:append("~")
  -- vim.opt.shortmess:append "I" -- don't show the default intro message
  vim.opt.shortmess:remove("I")     -- don't show the default intro message
  vim.opt.shortmess:remove("c")     -- don't show redundant messages from ins-completion-menu
  vim.opt.formatoptions:append("j") -- join comments when it makes sense
  vim.opt.formatoptions:append("c") -- Auto-wrap comments using textwidth, inserting the current comment leader automatically.
  vim.opt.formatoptions:append("r") -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
  vim.opt.formatoptions:append("o") -- Automatically insert the current comment leader after hitting "o" or "O" in Normal mode.
  vim.opt.formatoptions:append("q") -- Allow formatting of comments with "gq".

  -- local exists = function(file)
  --   local ok, err, code = os.rename(file, file)
  --   if not ok then
  --     if code == 13 then
  --       -- Permission denied, but it exists
  --       return true
  --     end
  --   end
  --   return ok, err
  -- end

  --- Check if a directory exists in this path
  -- local isdir = function(path)
  --   -- "/" works on both Unix and Windows
  --   return exists(path .. "/")
  -- end

  vim.opt.directory = vim.fs.joinpath(vim.fn.stdpath("cache"), "swag")
  vim.opt.undodir = vim.fs.joinpath(vim.fn.stdpath("cache"), "undo")
  vim.opt.backupdir = vim.fs.joinpath(vim.fn.stdpath("cache"), "backup")
  vim.opt.viewdir = vim.fs.joinpath(vim.fn.stdpath("cache"), "view")
  -- vim.opt.spellfile = vim.fs.joinpath(vim.fn.stdpath("cache"), "/spell/en.uft-8.add")
  vim.opt.shadafile = vim.fs.joinpath(vim.fn.stdpath("cache"), "shada")
  vim.opt.shada = [[!,'300,<50,@100,s10,h]]
  vim.opt.filetype = "plugin"
  vim.opt.fsync = true
  vim.opt.backup = false -- creates a backup file
  vim.opt.writebackup = false
  vim.opt.undofile = true
  vim.opt.swapfile = false -- Use a swapfile for the buffer.
  vim.opt.history = 2000   -- The command-lines that you enter are remembered in a history table.
  vim.opt.autoread = true  -- When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
  vim.opt.backupskip = { "/tmp/*", "$TMPDIR/*", "$TMP/*", "$TEMP/*", "*/shm/*", "/private/var/*", ".vault.vim" }

  vim.opt.title = true                       -- set the title of window to the value of the titlestring
  vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
  vim.opt.background = "dark"
  vim.opt.guifont = "Lilex Nerd Font:h10"
  vim.opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]
  vim.opt.termguicolors = true
  vim.opt.errorbells = false -- Ring the bell (beep or screen flash) for error messages.
  vim.opt.visualbell = false -- Use visual bell instead of beeping.
  -- vim.opt.lazyredraw = true -- Redraw only when needed.
  vim.opt.redrawtime = 1500
  vim.opt.signcolumn = "number" -- "yes:1"
  vim.opt.showtabline = 1       -- always show tabs 2 always, 1 more then 1 tab, 0 never
  vim.opt.winwidth = 30
  vim.opt.winminwidth = 10
  vim.opt.pumheight = 15 -- pop up menu height
  vim.opt.helpheight = 12
  vim.opt.previewheight = 12
  vim.opt.showcmd = true           -- Show (partial) command in the last line of the screen.
  vim.opt.cmdheight = 1            -- more space in the neovim command line for displaying messages
  vim.opt.cmdwinheight = 5         -- Number of screen lines to use for the command-line window.
  vim.opt.equalalways = false      -- When on, all the windows are automatically made the same size after splitting or closing a window.
  vim.opt.laststatus = 3           -- The value of this option influences when the last window will have a status linealways and ONLY the last window
  vim.opt.display = "lastline"
  vim.opt.cursorline = false       --  Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
  vim.opt.cursorlineopt =
  "number"                         -- (line,screenline,number, both - line/number ) Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
  -- vim.opt.pumblend = 0
  -- vim.opt.winblend = 0
  vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
  vim.opt.number = true
  -- vim.opt.relativenumber = true,
  vim.opt.showmode = false -- shows modes like -- INSERT --
  vim.opt.scrolloff = 2
  vim.opt.sidescrolloff = 5

  -- vim.opt.syntax = "enable" -- Syntax highlighting enables Vim to show parts of the text in another font or color.
  vim.opt.hidden = true                                                -- required to keep multiple buffers and open multiple buffers
  -- vim.opt.fileformats = { "unix", "mac", "dos" }
  vim.opt.magic = true                                                 -- Some characters in the pattern, such as letters, are taken literally.
  vim.opt.virtualedit = "block"                                        -- Allow virtual editing in Visual block mode.
  vim.opt.viewoptions = { "folds", "cursor", "curdir" }
  vim.opt.sessionoptions = { "curdir", "help", "tabpages", "winsize" } -- Changes the effect of the |:mksession| command.
  vim.opt.wildignorecase = true                                        -- When set case is ignored when completing file names and directories.
  vim.opt.wildignore = {                                               -- A file that matches with one of these patterns is ignored when expanding |wildcards|
    "*.pyc",
    "*.o",
    "*.out",
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.gif",
    "*.zip",
    "**/tmp/**",
    "*.DS_Store",
    "**/node_modules/**",
    "**/bower_modules/**",
  }
  vim.opt.complete = { ".", "w", "b", "k" }                                  -- set the matches for Insert mode completion.
  vim.opt.grepformat = "%f:%l:%c:%m"                                         -- Format to recognize for the ":grep" command output.
  vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"                  -- Program to use for the |:grep| command.
  vim.opt.startofline = false                                                -- When "on" the commands listed below move the cursor to the first non-blank of the line.
  vim.opt.switchbuf = "useopen"                                              -- This option controls the behavior when switching between buffers.
  vim.opt.backspace = { "indent", "eol", "start" }
  vim.opt.diffopt = { "filler", "iwhite", "internal", "algorithm:patience" } -- Option settings for diff mode.
  vim.opt.completeopt = { "menuone", "noselect" }
  vim.opt.jumpoptions = "stack"                                              -- List of words that change the behavior of the |jumplist|.
  vim.opt.foldlevelstart = 99                                                -- Sets "foldlevel" when starting to edit another buffer in a window.
  vim.opt.foldmethod = "expr"                                                -- folding set to "expr" for treesitter based folding
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"                            -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  vim.opt.ruler = true                                                       --  Show the line and column number of the cursor position, separated by a comma.
  vim.opt.wrap = false                                                       -- When on, lines longer than the width of the window will wrap and displaying continues on the next line.
  vim.opt.synmaxcol = 500                                                    -- Maximum column in which to search for syntax items.
  vim.opt.linebreak = false                                                  -- indext the linenumber (I hate this...) -- If on, Vim will wrap long lines at a character in "breakat" rather than at the last character that fits on the screen.
  vim.opt.breakat =
  [[\ \ ;:,!?]]                                                              -- his option lets you choose which characters might cause a line break if "linebreak" is on.
  vim.opt.breakindentopt = {                                                 -- Settings for "breakindent".
    shift = 2,
    min = 20,
  }
  vim.opt.foldenable = false    -- When off, all folds are open.
  vim.opt.conceallevel = 2      -- set to 0 if `` is visible in markdown files
  vim.opt.concealcursor =
  "niv"                         -- Sets the modes in which text in the cursor line can also be concealed. When the current mode is listed then concealing happens just like in other lines.

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
  -- vim.o.shell = ""
end
------------------------------------------------------------
-- Leader
------------------------------------------------------------
M.leader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    vim.keymap.set({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.mapleader = c
end
------------------------------------------------------------
-- Local Leader
------------------------------------------------------------
M.localleader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    vim.keymap.set({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.maplocalleader = c
end
------------------------------------------------------------
-- Default Plugin Specifcations
------------------------------------------------------------
M.plugin_specification = function()
  return {
    --lsp
    { "VonHeikemen/lsp-zero.nvim",         branch = "v4.x" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { "lukas-reineke/cmp-under-comparator" },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      -- build = ":Copilot auth",
      event = { "InsertEnter" },
      config = function(_, opts)
        local copilot = require("copilot")
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(event)
            copilot.setup(opts)
          end,
        })
      end,
    },
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
    -- mini
    {
      "echasnovski/mini.icons",
      lazy = true,
      opts = {
        file = {
          [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
          ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
        },
        filetype = {
          dotenv = { glyph = "", hl = "MiniIconsYellow" },
        },
      },
      init = function()
        package.preload["nvim-web-devicons"] = function()
          require("mini.icons").mock_nvim_web_devicons()
          return package.loaded["nvim-web-devicons"]
        end
      end,
    },
    {
      "echasnovski/mini.indentscope",
      -- enabled = false,
      opts = {
        draw = {
          -- Delay (in ms) between event and start of drawing scope indicator
          delay = 100,

          -- Animation rule for scope's first drawing. A function which, given
          -- next and total step numbers, returns wait time (in ms). See
          -- |MiniIndentscope.gen_animation()| for builtin options. To disable
          -- animation, use `require('mini.indentscope').gen_animation('none')`.
          -- animation = --<function: implements constant 20ms between steps>,
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Textobjects
          object_scope = "ii",
          object_scope_with_border = "ai",

          -- Motions (jump to respective border line; if not present - body line)
          goto_top = "[i",
          goto_bottom = "]i",
        },

        -- Options which control scope computation
        options = {
          -- Type of scope's border: which line(s) with smaller indent to
          -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
          border = "both",

          -- Whether to use cursor column when computing reference indent.
          -- Useful to see incremental scopes with horizontal cursor movements.
          indent_at_cursor = true,

          -- Whether to first check input line to be a border of adjacent scope.
          -- Use it if you want to place cursor on function header to get scope of
          -- its body.
          try_as_border = false,
        },

        -- Which character to use for drawing scope indicator
        symbol = "╎",
      }
    },
    {
      "echasnovski/mini.nvim",
      version = false,
      opts = {
        -- Add custom surroundings to be used on top of builtin ones. For more
        -- information with examples, see `:h MiniSurround.config`.
        custom_surroundings = nil,

        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 500,

        -- Module mappings. Use `'` (empty string) to disable one.
        mappings = {
          add = "sa",            -- Add surrounding in Normal and Visual modes
          delete = "sd",         -- Delete surrounding
          find = "sf",           -- Find surrounding (to the right)
          find_left = "sF",      -- Find surrounding (to the left)
          highlight = "sh",      -- Highlight surrounding
          replace = "sr",        -- Replace surrounding
          update_n_lines = "sn", -- Update `n_lines`

          suffix_last = "l",     -- Suffix to search with "prev" method
          suffix_next = "n",     -- Suffix to search with "next" method
        },

        -- Number of lines within which surrounding is searched
        n_lines = 20,

        -- Whether to respect selection type:
        -- - Place surroundings on separate lines in linewise mode.
        -- - Place surroundings on each line in blockwise mode.
        respect_selection_type = false,

        -- How to search for surrounding (first inside current line, then inside
        -- neighborhood). One of "cover", "cover_or_next", "cover_or_prev",
        -- "cover_or_nearest", "next", "prev", "nearest". For more details,
        -- see `:h MiniSurround.config`.
        search_method = "cover",

        -- Whether to disable showing non-error feedback
        silent = false,
      },
      config = function(_, opts)
        require("mini.surround").setup(opts)
      end,
    },
    -- telescope
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
    },
    {
      "nvim-telescope/telescope-frecency.nvim"
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "rcarriga/nvim-notify" },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = function()
        local telescope = require("telescope")
        local extensions = {
          "fzf",
          "frecency",
          "fzf_native",
          "ui_select",
          "notify",
          "file_browser",
        }
        for _, ext in ipairs(extensions) do
          pcall(telescope.load_extension, ext)
        end
        return {
          defaults = {
            prompt_prefix = "  ",
            selection_caret = " ",
            entry_prefix = "  ",
            multi_icon = "",
            initial_mode = "insert",
            path_display = { "truncate" },
            -- path_display = { shorten = 5 },
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            border = true,
            borderchars = {
              "─",
              "│",
              "─",
              "│",
              "╭",
              "╮",
              "╯",
              "╰",
            },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" },
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            treesitter = true,
            dynamic_preview_title = true,
            history = {
              limit = 100,
            },
            layout_config = {
              horizontal = {
                width = 0.95,
                height = 0.85,
                prompt_position = "top",
                results_width = 0.8,
                preview_width = function(_, cols, _)
                  if cols > 200 then
                    return math.floor(cols * 0.4)
                  else
                    return math.floor(cols * 0.6)
                  end
                end,
              },
              vertical = {
                mirror = false,
                width = 0.9,
                height = 0.95,
                preview_height = 0.5,
              },
              flex = {
                horizontal = {
                  preview_width = 0.9,
                },
              },
              width = 0.95,
              height = 0.90,
              preview_cutoff = 120,
            },
            vimgrep_arguments = {
              "rg",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
              "--hidden",
              "--glob=!.git/",
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {
              "node_modules",
              ".git",
              "target",
              "vendor",
            },
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            -- mappings = keys.telescope(),
          },
          pickers = {
            file_browser = {
              cwd_to_path = true,
              hidden = true,
            },
            find_files = {
              hidden = true,
              find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
            },
            live_grep = {
              hidden = true,
              only_sort_text = true,
            },
            fd = {
              mappings = {
                n = {
                  ["kj"] = "close",
                },
              },
            },
          },
          extensions = {
            -- fzy_native = {
            --   override_generic_sorter = true,
            --   override_file_sorter = true,
            -- },
            fzf = {
              fuzzy = true,                   -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true,    -- override the file sorter
              case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
              -- the default case_mode is "smart_case"
            },
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
                -- even more opts
              },
            },
            frecency = {
              show_scores = false,
              show_unindexed = true,
              ignore_patterns = { "*.git/*", "*/tmp/*" },
              disable_devicons = false,
              -- workspaces = {
              --   ["config"] = vim.fs.joinpath(os.getenv "HOME", ".config"),
              --   ["data"] = vim.fs.joinpath(os.getenv "HOME", ".local", "share"),
              --   ["project"] = vim.fs.joinpath(os.getenv "HOME", "Documents"),
              -- },
            },
            -- hidden_files = true, -- default: false
            -- theme = "dropdown",
          },
        }
      end,
    },
    -- Alpha
    {
      "goolord/alpha-nvim",
      dependencies = {
        "echasnovski/mini.icons",
        "nvim-lua/plenary.nvim",
      },
      opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local utils = require("alpha.utils")
        local theta = require("alpha.themes.theta")
        -- local icon, color  ("init.lua", "lua")
        local get_icon_color = require('nvim-web-devicons').get_icon_color

        local function colorize(logo, colors, logoColors)
          -- helper function for utf8 chars
          local function get_char_len(s, pos)
            local byte = string.byte(s, pos)
            if not byte then
              return nil
            end
            return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
          end

          header = dashboard.section.header
          -- dashboard.section.header.val = logo
          header.val = logo

          for key, color in pairs(colors) do
            local name = "Alpha" .. key
            vim.api.nvim_set_hl(0, name, color)
            colors[key] = name
          end

          -- dashboard.section.header.opts.hl = {}
          header.opts.hl = {}
          for i, line in ipairs(logoColors) do
            local highlights = {}
            local pos = 0

            for j = 1, #line do
              local opos = pos
              pos = pos + get_char_len(logo[i], opos + 1)

              local color_name = colors[line:sub(j, j)]
              if color_name then
                table.insert(highlights, { color_name, opos, pos })
              end
            end

            -- table.insert(dashboard.section.header.opts.hl, highlights)
            table.insert(header.opts.hl, highlights)
          end
          -- return dashboard.header
          return header
        end

        local header = colorize({
          [[  ███       ███  ]],
          [[  ████      ████ ]],
          [[  ████     █████ ]],
          [[ █ ████    █████ ]],
          [[ ██ ████   █████ ]],
          [[ ███ ████  █████ ]],
          [[ ████ ████ ████ ]],
          [[ █████  ████████ ]],
          [[ █████   ███████ ]],
          [[ █████    ██████ ]],
          [[ █████     █████ ]],
          [[ ████      ████ ]],
          [[  ███       ███  ]],
          [[                    ]],
          [[  N  E  O  V  I  M  ]],
        }, {
          ["b"] = { fg = "#3399ff", ctermfg = 33 },
          ["a"] = { fg = "#53C670", ctermfg = 35 },
          ["g"] = { fg = "#39ac56", ctermfg = 29 },
          ["h"] = { fg = "#33994d", ctermfg = 23 },
          ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29 },
          ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
          ["k"] = { fg = "#30A572", ctermfg = 36 },
        }, {
          [[  kkkka       gggg  ]],
          [[  kkkkaa      ggggg ]],
          [[ b kkkaaa     ggggg ]],
          [[ bb kkaaaa    ggggg ]],
          [[ bbb kaaaaa   ggggg ]],
          [[ bbbb aaaaaa  ggggg ]],
          [[ bbbbb aaaaaa igggg ]],
          [[ bbbbb  aaaaaahiggg ]],
          [[ bbbbb   aaaaajhigg ]],
          [[ bbbbb    aaaaajhig ]],
          [[ bbbbb     aaaaajhi ]],
          [[ bbbbb      aaaaajh ]],
          [[  bbbb       aaaaa  ]],
          [[                    ]],
          [[  a  a  a  b  b  b  ]],
        })

        local mru = {
          type = "group",
          val = {
            {
              type = "text",
              val = "Recent files",
              opts = {
                hl = "SpecialComment",
                shrink_margin = false,
                position = "center",
              },
            },
            { type = "padding", val = 1 },
            {
              type = "group",
              val = function()
                return { theta.mru(0, vim.fn.getcwd()) }
              end,
              opts = { shrink_margin = false },
            },
          },
        }

        local buttons = {
          type = "group",
          val = {
            { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            dashboard.button("e", "  New File", ":ene<cr>"),
            dashboard.button("f", "  Find File", ":Telescope fd<cr>"),
            dashboard.button("g", "  Live Grep", ":Telescope live_grep<cr>"),
            dashboard.button("z", "󰡱  fzf", ":FzfLua<cr>"),
            -- dashboard.button("c",       "  Configuration",   ":edit " .. vim.fs.joinpath(vim.fn.stdpath("config"), "init.lua") .. "<cr>"), --":lua vim.fn.stdpath('config')<cr>"),
            dashboard.button("c", "  Neovim Configs",
              ":lua require('telescope').extensions.file_browser.file_browser({path = vim.fn.stdpath('config')})<cr>"),
            dashboard.button("l", "󰒲  Lazy", ":Lazy<cr>"),
            dashboard.button("q", "✗  Quit", ":qa<cr>"),
          },
          position = "center",
        }


        return {
          layout = {
            { type = "padding", val = 1 },
            header,
            { type = "padding", val = 1 },
            buttons,
            { type = "padding", val = 1 },
            mru,
          },
          opts = {
            margin = 5,
            setup = function()
              vim.api.nvim_create_autocmd('DirChanged', {
                pattern = '*',
                group = "alpha_temp",
                callback = function()
                  require('alpha').redraw()
                  vim.cmd('AlphaRemap')
                end,
              })
            end,
          },
        }
      end
    },
    -- barbar
    {
      "romgrk/barbar.nvim",
      enabled = true,
      dependencies = {
        "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
      },
      init = function() vim.g.barbar_auto_setup = false end,
      opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.

        -- Enable/disable animations
        animation = true,

        -- Automatically hide the tabline when there are this many buffers left.
        -- Set to any value >=0 to enable.
        auto_hide = false,

        -- Enable/disable current/total tabpages indicator (top right corner)
        -- tabpages = true,

        -- Enables/disable clickable tabs
        --  - left-click: go to buffer
        --  - middle-click: delete buffer
        clickable = true,

        -- Excludes buffers from the tabline
        exclude_ft = {},
        exclude_name = {},

        -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
        -- Valid options are 'left' (the default), 'previous', and 'right'
        focus_on_close = 'left',

        -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
        -- hide = { extensions = true, inactive = true },

        -- Disable highlighting alternate buffers
        -- highlight_alternate = false,

        -- Disable highlighting file icons in inactive buffers
        -- highlight_inactive_file_icons = false,

        -- Enable highlighting visible buffers
        highlight_visible = true,

        icons = {
          -- Configure the base icons on the bufferline.
          -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
          -- buffer_index = "superscript",
          -- buffer_number = "subscript",
          button = '',
          -- Enables / disables diagnostic symbols
          -- diagnostics = {
          --   [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
          --   [vim.diagnostic.severity.WARN] = {enabled = false},
          --   [vim.diagnostic.severity.INFO] = {enabled = false},
          --   [vim.diagnostic.severity.HINT] = {enabled = true},
          -- },
          gitsigns = {
            added = { enabled = true, icon = '+' },
            changed = { enabled = true, icon = '~' },
            deleted = { enabled = true, icon = '-' },
          },
          filetype = {
            -- Sets the icon's highlight group.
            -- If false, will use nvim-web-devicons colors
            -- custom_colors = true,

            -- Requires `nvim-web-devicons` if `true`
            enabled = true,
          },
          -- separator = {left = '▎', right = ''},
          separator = { left = '|', right = '' },

          -- If true, add an additional separator at the end of the buffer list
          -- separator_at_end = true,

          -- Configure the icons on the bufferline when modified or pinned.
          -- Supports all the base icon options.
          modified = { button = '●' },
          pinned = { button = '', filename = true },

          -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
          preset = 'default',

          -- Configure the icons on the bufferline based on the visibility of a buffer.
          -- Supports all the base icon options, plus `modified` and `pinned`.
          -- alternate = {filetype = {enabled = false}},
          -- current = {buffer_index = true},
          -- inactive = {button = '×'},
          -- visible = {modified = {buffer_number = false}},
        },

        -- If true, new buffers will be inserted at the start/end of the list.
        -- Default is to insert after current buffer.
        insert_at_end = false,
        insert_at_start = false,

        -- Sets the maximum padding width with which to surround each tab
        maximum_padding = 1,

        -- Sets the minimum padding width with which to surround each tab
        minimum_padding = 1,

        -- Sets the maximum buffer name length.
        maximum_length = 30,

        -- Sets the minimum buffer name length.
        minimum_length = 0,

        -- If set, the letters for each buffer in buffer-pick mode will be
        -- assigned based on their name. Otherwise or in case all letters are
        -- already assigned, the behavior is to assign letters in order of
        -- usability (see order below)
        semantic_letters = true,

        -- Set the filetypes which barbar will offset itself for
        sidebar_filetypes = {
          -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
          -- NvimTree = true,
          -- -- Or, specify the text used for the offset:
          -- undotree = {
          --   text = 'undotree',
          --   align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
          -- },
          -- Or, specify the event which the sidebar executes when leaving:
          ['neo-tree'] = { event = 'BufWipeout' },
          -- -- Or, specify all three
          -- Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
        },

        -- New buffer letters are assigned in this order. This order is
        -- optimal for the qwerty keyboard layout but might need adjustment
        -- for other layouts.
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

        -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
        -- where X is the buffer number. But only a static string is accepted here.
        -- no_name_title = nil,

        -- sorting options
        sort = {
          -- tells barbar to ignore case differences while sorting buffers
          ignore_case = true,
        },
      },
      version = "^1.0.0", -- optional: only update when a new 1.x version is released
    },
    {
      "soulis-1256/eagle.nvim",
      event = "LspAttach",
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      vscode = true,
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
      },
    },
    {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
      end
    },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "tpope/vim-repeat" },
    {
      "rebelot/heirline.nvim",
      dependencies = { "zeioth/heirline-components.nvim" },
      opts = function()
        local lib = require "heirline-components.all"
        return {
          opts = {
            disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
              local is_disabled = not require("heirline-components.buffer").is_valid(args.buf) or
                  lib.condition.buffer_matches({
                    buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                    filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
                  }, args.buf)
              return is_disabled
            end,
          },
          tabline = { -- UI upper bar
            lib.component.tabline_conditional_padding(),
            lib.component.tabline_buffers(),
            lib.component.fill { hl = { bg = "tabline_bg" } },
            lib.component.tabline_tabpages()
          },
          winbar = { -- UI breadcrumbs bar
            init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
            fallthrough = false,
            -- Winbar for terminal, neotree, and aerial.
            {
              condition = function() return not lib.condition.is_active() end,
              {
                lib.component.neotree(),
                lib.component.compiler_play(),
                lib.component.fill(),
                lib.component.compiler_build_type(),
                lib.component.compiler_redo(),
                lib.component.aerial(),
              },
            },
            -- Regular winbar
            {
              lib.component.neotree(),
              lib.component.compiler_play(),
              lib.component.fill(),
              lib.component.breadcrumbs(),
              lib.component.fill(),
              lib.component.compiler_redo(),
              lib.component.aerial(),
            }
          },
          statuscolumn = { -- UI left column
            init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
            lib.component.foldcolumn(),
            lib.component.numbercolumn(),
            lib.component.signcolumn(),
          } or nil,
          statusline = { -- UI statusbar
            hl = { fg = "fg", bg = "bg" },
            lib.component.mode({
              mode_text = {
                -- pad_text = "center",
                hl = { fg = "#282c34" },
              },
              hl = { fg = "fg" },
              paste = { str = "", icon = { kind = "Paste" }, show_empty = true },      -- if set, displays if paste is enabled.
              spell = { str = "", icon = { kind = "Spellcheck" }, show_empty = true }, -- if set, displays if spellcheck is on
              surround = {
                separator = "left",                                                    -- where to add the separator.
                -- color = hl.mode_bg,                              -- you can set a custom background color, for example "#444444".
                update = { "ModeChanged", pattern = "*:*" }                            -- events that make the surround provider refresh.
              },
              -- hl = hl.get_attributes "mode",                     -- you can specify your own highlight group here.
              update = {
                "ModeChanged", -- events that make this component refresh.
                pattern = "*:*",
                callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
              },
            }),
            -- ViMode,
            lib.component.git_branch(),
            lib.component.file_info({ filetype = false, filename = {}, file_modified = false }),
            lib.component.git_diff(),
            lib.component.diagnostics({
              ERROR = { icon = { kind = "DiagnosticError", padding = { left = 1, right = 1 } }, }, -- if set, it will display icon+number of errors.
              WARN = { icon = { kind = "DiagnosticWarn", padding = { left = 1, right = 1 } }, }, -- if set, it will display icon+number of warnings.
              INFO = { icon = { kind = "DiagnosticInfo", padding = { left = 1, right = 1 } }, }, -- if set, it will display icon+number of info.
              HINT = { icon = { kind = "DiagnosticHint", padding = { left = 1, right = 1 } }, }, -- if set, it will display icon+number of hints.
              surround = {
                separator = "left",                                                              -- where to add the separator.
                color = "diagnostics_bg",                                                        -- you can set a custom background color, for example "#444444".
                condition = require("heirline-components.all").condition
                .has_diagnostics                                                                 -- a function that determines when to display the component.
              },
              -- hl = hl.get_attributes "diagnostics",                                        -- you can specify your own highlight group here.
              -- on_click = { name = "<your_event_name", callback = function() end }          -- what happens when you click the component.
              update = { "DiagnosticChanged", "BufEnter" }, -- events that make the component refresh.
            }),
            lib.component.fill(),
            lib.component.cmd_info(),
            lib.component.fill(),
            lib.component.lsp({
              lsp_client_names = {
                str = "LSP",
                update = {
                  "LspAttach",
                  "LspDetach",
                  "BufEnter",
                  "VimResized",
                  callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
                },
                icon = {
                  kind = "ActiveLSP",
                  -- kind = "",
                  padding = { right = 2 }
                },
              }
            }),
            lib.component.compiler_state(),
            lib.component.virtual_env(),
            lib.component.nav(),
            -- lib.component.mode { surround = { separator = "right" } },
          },
        }
      end,
      config = function(_, opts)
        local heirline = require("heirline")
        local heirline_components = require "heirline-components.all"

        -- Setup
        heirline_components.init.subscribe_to_events()
        heirline.load_colors(heirline_components.hl.get_colors())
        heirline.setup(opts)
      end,
    },
    {
      "phaazon/hop.nvim",
      opts = { keys = "etovxqpdygfblzhckisuran" }
    },
    {
      "nvimdev/lspsaga.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",   -- optional
        "nvim-tree/nvim-web-devicons",       -- optional
      },
      event = "LspAttach",
      -- enabled = false,
      opts = {
        -- your configuration
        -- Options with default value
        -- "single" | "double" | "rounded" | "bold" | "plus"
        border_style = "rounded",
        --the range of 0 for fully opaque window (disabled) to 100 for fully
        --transparent background. Values between 0-30 are typically most useful.
        saga_winblend = 0,
        -- when cursor in saga window you config these to move
        move_in_saga = { prev = "<C-p>", next = "<C-n>" },
        -- Error, Warn, Info, Hint
        -- use emoji like
        -- { "🙀", "😿", "😾", "😺" }
        -- or
        -- { "😡", "😥", "😤", "😐" }
        -- and diagnostic_header can be a function type
        -- must return a string and when diagnostic_header
        -- is function type it will have a param `entry`
        -- entry is a table type has these filed
        -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
        diagnostic_header = { " ", " ", " ", "ﴞ " },
        -- preview lines above of lsp_finder
        preview_lines_above = 0,
        -- preview lines of lsp_finder and definition preview
        max_preview_lines = 10,
        -- use emoji lightbulb in default
        code_action_icon = "",
        -- if true can press number to execute the codeaction in codeaction window
        code_action_num_shortcut = true,
        -- same as nvim-lightbulb but async
        code_action_lightbulb = {
          enable = false,
          enable_in_insert = false,
          cache_code_action = true,
          sign = true,
          update_time = 150,
          sign_priority = 20,
          virtual_text = true,
        },
        -- finder icons
        finder_icons = {
          def = "  ",
          ref = "諭 ",
          link = "  ",
        },
        -- finder do lsp request timeout
        -- if your project big enough or your server very slow
        -- you may need to increase this value
        finder_request_timeout = 1500,
        finder_action_keys = {
          open = { "o", "<CR>" },
          vsplit = "s",
          split = "i",
          tabe = "t",
          quit = { "q", "<ESC>" },
        },
        code_action_keys = {
          quit = "q",
          exec = "<CR>",
        },
        definition_action_keys = {
          edit = "<C-c>o",
          vsplit = "<C-c>v",
          split = "<C-c>i",
          tabe = "<C-c>t",
          quit = "q",
        },
        rename_action_quit = "<C-c>",
        rename_in_select = true,
        -- show symbols in winbar must nightly
        -- in_custom mean use lspsaga api to get symbols
        -- and set it to your custom winbar or some winbar plugins.
        -- if in_cusomt = true you must set in_enable to false
        symbol_in_winbar = {
          in_custom = false,
          enable = false,
          separator = " ",
          show_file = true,
          -- define how to customize filename, eg: %:., %
          -- if not set, use default value `%:t`
          -- more information see `vim.fn.expand` or `expand`
          -- ## only valid after set `show_file = true`
          file_formatter = "",
          click_support = false,
        },
        -- show outline
        show_outline = {
          win_position = "right",
          --set special filetype win that outline window split.like NvimTree neotree
          -- defx, db_ui
          win_with = "",
          win_width = 30,
          auto_enter = true,
          auto_preview = true,
          virt_text = "┃",
          jump_key = "o",
          -- auto refresh when change buffer
          auto_refresh = true,
        },
        -- custom lsp kind
        -- usage { Field = "color code"} or {Field = {your icon, your color code}}
        custom_kind = {},
        -- if you don"t use nvim-lspconfig you must pass your server name and
        -- the related filetypes into this table
        -- like server_filetype_map = { metals = { "sbt", "scala" } }
        server_filetype_map = {},
      }
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      enabled = false,
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      },
      opts = {
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
      },
      config = function()
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup({
          close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
          open_files_using_relative_paths = false,
          sort_case_insensitive = false,                                     -- used when sorting files and directories in the tree
          sort_function = nil,                                               -- use a custom function for sorting files and directories in the tree
          -- sort_function = function (a,b)
          --       if a.type == b.type then
          --           return a.path > b.path
          --       else
          --           return a.type > b.type
          --       end
          --   end , -- this sorts files and directories descendantly
          default_component_configs = {
            container = {
              enable_character_fade = true,
            },
            indent = {
              indent_size = 2,
              padding = 1, -- extra padding on left hand side
              -- indent guides
              with_markers = true,
              indent_marker = "│",
              last_indent_marker = "└",
              highlight = "NeoTreeIndentMarker",
              -- expander config, needed for nesting files
              with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
              expander_collapsed = "",
              expander_expanded = "",
              expander_highlight = "NeoTreeExpander",
            },
            icon = {
              folder_closed = "",
              folder_open = "",
              folder_empty = "󰜌",
              provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
                if node.type == "file" or node.type == "terminal" then
                  local success, web_devicons = pcall(require, "nvim-web-devicons")
                  local name = node.type == "terminal" and "terminal" or node.name
                  if success then
                    local devicon, hl = web_devicons.get_icon(name)
                    icon.text = devicon or icon.text
                    icon.highlight = hl or icon.highlight
                  end
                end
              end,
              -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
              -- then these will never be used.
              default = "*",
              highlight = "NeoTreeFileIcon",
            },
            modified = {
              symbol = "[+]",
              highlight = "NeoTreeModified",
            },
            name = {
              trailing_slash = false,
              use_git_status_colors = true,
              highlight = "NeoTreeFileName",
            },
            git_status = {
              symbols = {
                -- Change type
                added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted = "✖", -- this can only be used in the git_status source
                renamed = "󰁕", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored = "",
                unstaged = "󰄱",
                staged = "",
                conflict = "",
              },
            },
            -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
            file_size = {
              enabled = true,
              width = 12,          -- width of the column
              required_width = 64, -- min width of window required to show this column
            },
            type = {
              enabled = true,
              width = 10,           -- width of the column
              required_width = 122, -- min width of window required to show this column
            },
            last_modified = {
              enabled = true,
              width = 20,          -- width of the column
              required_width = 88, -- min width of window required to show this column
            },
            created = {
              enabled = true,
              width = 20,           -- width of the column
              required_width = 110, -- min width of window required to show this column
            },
            symlink_target = {
              enabled = false,
            },
          },
          -- A list of functions, each representing a global custom command
          -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
          -- see `:h neo-tree-custom-commands-global`
          commands = {},
          window = {
            -- position = "left",
            position = "right",
            width = 20,
            mapping_options = {
              noremap = true,
              nowait = true,
            },
            mappings = {
              ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
              },
              ["<2-LeftMouse>"] = "open",
              ["<cr>"] = "open",
              ["<esc>"] = "cancel", -- close preview or floating neo-tree window
              ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
              -- Read `# Preview Mode` for more information
              ["l"] = "focus_preview",
              ["S"] = "open_split",
              ["s"] = "open_vsplit",
              -- ["S"] = "split_with_window_picker",
              -- ["s"] = "vsplit_with_window_picker",
              ["t"] = "open_tabnew",
              -- ["<cr>"] = "open_drop",
              -- ["t"] = "open_tab_drop",
              ["w"] = "open_with_window_picker",
              --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
              ["C"] = "close_node",
              -- ['C'] = 'close_all_subnodes',
              ["z"] = "close_all_nodes",
              --["Z"] = "expand_all_nodes",
              ["a"] = {
                "add",
                -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                  show_path = "none", -- "none", "relative", "absolute"
                },
              },
              ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
              ["d"] = "delete",
              ["r"] = "rename",
              ["b"] = "rename_basename",
              ["y"] = "copy_to_clipboard",
              ["x"] = "cut_to_clipboard",
              ["p"] = "paste_from_clipboard",
              ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
              -- ["c"] = {
              --  "copy",
              --  config = {
              --    show_path = "none" -- "none", "relative", "absolute"
              --  }
              --}
              ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
              ["q"] = "close_window",
              ["R"] = "refresh",
              ["?"] = "show_help",
              ["<"] = "prev_source",
              [">"] = "next_source",
              ["i"] = "show_file_details",
              -- ["i"] = {
              --   "show_file_details",
              --   -- format strings of the timestamps shown for date created and last modified (see `:h os.date()`)
              --   -- both options accept a string or a function that takes in the date in seconds and returns a string to display
              --   -- config = {
              --   --   created_format = "%Y-%m-%d %I:%M %p",
              --   --   modified_format = "relative", -- equivalent to the line below
              --   --   modified_format = function(seconds) return require('neo-tree.utils').relative_date(seconds) end
              --   -- }
              -- },
            },
          },
          nesting_rules = {},
          filesystem = {
            filtered_items = {
              visible = false, -- when true, they will just be displayed differently than normal items
              hide_dotfiles = true,
              hide_gitignored = true,
              hide_hidden = true, -- only works on Windows for hidden files/directories
              hide_by_name = {
                --"node_modules"
              },
              hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json",
              },
              always_show = { -- remains visible even if other settings would normally hide it
                --".gitignored",
              },
              always_show_by_pattern = { -- uses glob style patterns
                --".env*",
              },
              never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                --".DS_Store",
                --"thumbs.db"
              },
              never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
              },
            },
            follow_current_file = {
              enabled = false,                      -- This will find and focus the file in the active buffer every time
              --               -- the current file is changed while the tree is open.
              leave_dirs_open = false,              -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = false,               -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
            -- in whatever position is specified in window.position
            -- "open_current",  -- netrw disabled, opening a directory opens within the
            -- window like netrw would, regardless of window.position
            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
            window = {
              mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["D"] = "fuzzy_finder_directory",
                ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                -- ["D"] = "fuzzy_sorter_directory",
                ["f"] = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
                ["o"] = {
                  "show_help",
                  nowait = false,
                  config = { title = "Order by", prefix_key = "o" },
                },
                ["oc"] = { "order_by_created", nowait = false },
                ["od"] = { "order_by_diagnostics", nowait = false },
                ["og"] = { "order_by_git_status", nowait = false },
                ["om"] = { "order_by_modified", nowait = false },
                ["on"] = { "order_by_name", nowait = false },
                ["os"] = { "order_by_size", nowait = false },
                ["ot"] = { "order_by_type", nowait = false },
                -- ['<key>'] = function(state) ... end,
              },
              fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                ["<down>"] = "move_cursor_down",
                ["<C-n>"] = "move_cursor_down",
                ["<up>"] = "move_cursor_up",
                ["<C-p>"] = "move_cursor_up",
                ["<esc>"] = "close",
                -- ['<key>'] = function(state, scroll_padding) ... end,
              },
            },

            commands = {}, -- Add a custom command or override a global one using the same function name
          },
          buffers = {
            follow_current_file = {
              enabled = true,          -- This will find and focus the file in the active buffer every time
              --              -- the current file is changed while the tree is open.
              leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = true,   -- when true, empty folders will be grouped together
            show_unloaded = true,
            window = {
              mappings = {
                ["d"] = "buffer_delete",
                ["bd"] = "buffer_delete",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["o"] = {
                  "show_help",
                  nowait = false,
                  config = { title = "Order by", prefix_key = "o" },
                },
                ["oc"] = { "order_by_created", nowait = false },
                ["od"] = { "order_by_diagnostics", nowait = false },
                ["om"] = { "order_by_modified", nowait = false },
                ["on"] = { "order_by_name", nowait = false },
                ["os"] = { "order_by_size", nowait = false },
                ["ot"] = { "order_by_type", nowait = false },
              },
            },
          },
          git_status = {
            window = {
              position = "float",
              mappings = {
                ["A"] = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
                ["o"] = {
                  "show_help",
                  nowait = false,
                  config = { title = "Order by", prefix_key = "o" },
                },
                ["oc"] = { "order_by_created", nowait = false },
                ["od"] = { "order_by_diagnostics", nowait = false },
                ["om"] = { "order_by_modified", nowait = false },
                ["on"] = { "order_by_name", nowait = false },
                ["os"] = { "order_by_size", nowait = false },
                ["ot"] = { "order_by_type", nowait = false },
              },
            },
          },
        })

        vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>")
      end,
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      -- keys = {
      --   { "<leader>sn", "", desc = "+noice"},
      --   { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      --   { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      --   { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      --   { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      --   { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      --   { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
      --   { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
      --   { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
      -- },
      opts = {
        -- add any options here
        cmdline = {
          enabled = true,   -- enables the Noice cmdline UI
          view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
          opts = {},        -- global options for the cmdline. See section on views
          ---@type table<string, CmdlineFormat>
          format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            -- title: set to anything or empty string to hide
            cmdline = { pattern = "^:", icon = ":", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "?" },
            input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
          },
        },
        lsp = {
          progress = {
            enabled = false,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            --- @type NoiceFormat|string
            format = "lsp_progress",
            --- @type NoiceFormat|string
            format_done = "lsp_progress_done",
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = "mini",
          },
          override = {
            -- override the default lsp markdown formatter with Noice
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            -- override the lsp markdown formatter with Noice
            ["vim.lsp.util.stylize_markdown"] = false,
            -- override cmp documentation with Noice (needs the other options to work)
            ["cmp.entry.get_documentation"] = false,
          },
          hover = {
            enabled = true,
            silent = false, -- set to true to not show a message if hover is not available
            view = nil,     -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {},      -- merged with defaults from documentation
          },
          signature = {
            enabled = true,
            auto_open = {
              enabled = true,
              trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
              luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
              throttle = 50,  -- Debounce lsp signature help request by 50ms
            },
            view = nil,       -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {},        -- merged with defaults from documentation
          },
          message = {
            -- Messages shown by lsp servers
            enabled = true,
            view = "notify",
            opts = {},
          },
          -- defaults for hover and signature help
          documentation = {
            view = "hover",
            ---@type NoiceViewOptions
            opts = {
              lang = "markdown",
              replace = true,
              render = "plain",
              format = { "{message}" },
              win_options = { concealcursor = "n", conceallevel = 3 },
            },
          },
        },
        markdown = {
          hover = {
            ["|(%S-)|"] = vim.cmd.help, -- vim help links
            ["%[.-%]%((%S-)%)"] = function(...)
              local ok, util = pcall(require, "noice.util")
              if ok then
                return util.open(...)
              end
            end
            -- require("noice.util").open, -- markdown links
          },
          highlights = {
            ["|%S-|"] = "@text.reference",
            ["@%S+"] = "@parameter",
            ["^%s*(Parameters:)"] = "@text.title",
            ["^%s*(Return:)"] = "@text.title",
            ["^%s*(See also:)"] = "@text.title",
            ["{%S-}"] = "@parameter",
          },
        },
      },
      config = function(_, opts)
        -- HACK: noice shows messages from before it was enabled,
        -- but this is not ideal when Lazy is installing plugins,
        -- so clear the messages in this case.
        if vim.o.filetype == "lazy" then
          vim.cmd([[messages clear]])
        end
        require("noice").setup(opts)
      end,
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
      }
    },
    {
      "rcarriga/nvim-notify",
      opts = {
        stages = "slide",
        on_open = nil,
        on_close = nil,
        render = "default",
        timeout = 1000,
        background_colour = "Normal",
        minimum_width = 50,
      }
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      enabled = false,
    },
    {
      "nvim-tree/nvim-web-devicons",
      opts = {
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        -- override = {
        --   zsh = {
        --     icon = "",
        --     color = "#428850",
        --     cterm_color = "65",
        --     name = "Zsh"
        --   }
        -- };
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = true,
        -- set the light or dark variant manually, instead of relying on `background`
        -- (default to nil)
        -- variant = "dark", --"light|dark";
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
          }
        },
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
          ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
          }
        },
        -- same as `override` but specifically for operating system
        -- takes effect when `strict` is true
        override_by_operating_system = {
          ["apple"] = {
            icon = "",
            color = "#A2AAAD",
            cterm_color = "248",
            name = "Apple",
          },
        },
      }
    },
    {
      "olimorris/onedarkpro.nvim",
      -- enabled = false,
      lazy = false,    -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      opts = {
        highlights = {
          CursorLineNr = { fg = "${purple}", bg = "NONE" }, -- fix bg for CursorLineNr
          -- what transparent set
          -- Tabline = { bg = "${red}", fg = "${blue}"},
          -- Normal = { bg = "NONE" },
          -- Folded = { bg = "NONE" },
          -- SignColumn = { bg = "NONE", fg = "NONE" },
          -- Statusline = { bg = "NONE" },
          -- end of what transparent sets
          -- BufferlineSeparator = { fg = "${red}", bg = "${blue}" },
          -- BufferLineBackground = { bg = "${purple}", fg = "${red}" },
          -- BufferCurrent = { bg = "${red}", fg = "${yellow}" },
          -- TabLineFill = { bg = "${red}", fg = "${blue}" },
          BufferCurrent = {
            fg = "${white}",
            bg = "${black}",
          },
          BufferCurrentIndex = { link = "BufferCurrent" },
          BufferCurrentMod = { fg = "${purple}" },
          BufferCurrentSign = { link = "BufferCurrentMod" },
          BufferCurrentIcon = { link = "BufferCurrentMod" },
          BufferCurrentTarget = {
            bg = "${black}",
            fg = "${blue}",
          },
          BufferVisible = { fg = "${gray}" },
          BufferVisibleIndex = { link = "BufferVisible" },
          BufferVisibleMod = { link = "BufferVisible" },
          BufferVisibleSign = { link = "BufferVisibleMod" },
          BufferVisibleIcon = { link = "BufferVisibleMod" },
          BufferVisibleTarget = { link = "BufferCurrentTarget" },
          BufferInactive = { link = "BufferVisible" }, -- Buffer which is not active
          BufferInactiveIndex = { link = "BufferInactive" },
          BufferInactiveMod = { link = "BufferInactive" },
          BufferInactiveSign = { fg = "${black}" }, -- The inactive sign of a buffer
          BufferInactiveTarget = { link = "BufferCurrentTarget" },
          BufferTabpages = { fg = "${purple}" },    -- The tab page indicator on the right
          BufferTabpageFill = { fg = "${black}" },  -- The sign which marks the end of the bufferline
          Search = { fg = "${black}", bg = "${white}" },
          ["@lsp.type.comment"] = {}
        },
        styles = {
          types = "NONE",
          methods = "NONE",
          numbers = "NONE",
          strings = "NONE",
          comments = "NONE",
          keywords = "NONE",
          constants = "NONE",
          functions = "NONE",
          operators = "NONE",
          variables = "NONE",
          parameters = "NONE",
          conditionals = "NONE",
          virtual_text = "NONE",
        },
        options = {
          bold = true,                   -- Use bold styles?
          italic = true,                 -- Use italic styles?
          underline = true,              -- Use underline styles?
          undercurl = true,              -- Use undercurl styles?

          cursorline = true,             -- Use cursorline highlighting?
          transparency = true,           -- Use a transparent background?
          terminal_colors = true,        -- Use the theme's colors for Neovim's :terminal?
          window_unfocused_color = true, -- When the window is out of focus, change the normal background?
        },
      },
      config = function(LazyPlugin, opts)
        local odp = require("onedarkpro")
        odp.setup(opts)
        vim.cmd [[colorscheme onedark_vivid]]
      end
    },
    {
      'mrjones2014/smart-splits.nvim',
      opts = {
        -- Ignored buffer types (only while resizing)
        ignored_buftypes = {
          'nofile',
          'quickfix',
          'prompt',
        },
        -- Ignored filetypes (only while resizing)
        ignored_filetypes = { 'NvimTree' },
        -- the default number of lines/columns to resize by at a time
        default_amount = 3,
        -- Desired behavior when your cursor is at an edge and you
        -- are moving towards that same edge:
        -- 'wrap' => Wrap to opposite side
        -- 'split' => Create a new split in the desired direction
        -- 'stop' => Do nothing
        -- function => You handle the behavior yourself
        -- NOTE: If using a function, the function will be called with
        -- a context object with the following fields:
        -- {
        --    mux = {
        --      type:'tmux'|'wezterm'|'kitty'
        --      current_pane_id():number,
        --      is_in_session(): boolean
        --      current_pane_is_zoomed():boolean,
        --      -- following methods return a boolean to indicate success or failure
        --      current_pane_at_edge(direction:'left'|'right'|'up'|'down'):boolean
        --      next_pane(direction:'left'|'right'|'up'|'down'):boolean
        --      resize_pane(direction:'left'|'right'|'up'|'down'):boolean
        --      split_pane(direction:'left'|'right'|'up'|'down',size:number|nil):boolean
        --    },
        --    direction = 'left'|'right'|'up'|'down',
        --    split(), -- utility function to split current Neovim pane in the current direction
        --    wrap(), -- utility function to wrap to opposite Neovim pane
        -- }
        -- NOTE: `at_edge = 'wrap'` is not supported on Kitty terminal
        -- multiplexer, as there is no way to determine layout via the CLI
        at_edge = 'wrap',
        -- Desired behavior when the current window is floating:
        -- 'previous' => Focus previous Vim window and perform action
        -- 'mux' => Always forward action to multiplexer
        float_win_behavior = 'previous',
        -- when moving cursor between splits left or right,
        -- place the cursor on the same row of the *screen*
        -- regardless of line numbers. False by default.
        -- Can be overridden via function parameter, see Usage.
        move_cursor_same_row = false,
        -- whether the cursor should follow the buffer when swapping
        -- buffers by default; it can also be controlled by passing
        -- `{ move_cursor = true }` or `{ move_cursor = false }`
        -- when calling the Lua function.
        cursor_follows_swapped_bufs = false,
        -- resize mode options
        resize_mode = {
          -- key to exit persistent resize mode
          quit_key = '<ESC>',
          -- keys to use for moving in resize mode
          -- in order of left, down, up' right
          resize_keys = { 'h', 'j', 'k', 'l' },
          -- set to true to silence the notifications
          -- when entering/exiting persistent resize mode
          silent = false,
          -- must be functions, they will be executed when
          -- entering or exiting the resize mode
          hooks = {
            on_enter = nil,
            on_leave = nil,
          },
        },
        -- ignore these autocmd events (via :h eventignore) while processing
        -- smart-splits.nvim computations, which involve visiting different
        -- buffers and windows. These events will be ignored during processing,
        -- and un-ignored on completed. This only applies to resize events,
        -- not cursor movement events.
        ignored_events = {
          'BufEnter',
          'WinEnter',
        },
        -- enable or disable a multiplexer integration;
        -- automatically determined, unless explicitly disabled or set,
        -- by checking the $TERM_PROGRAM environment variable,
        -- and the $KITTY_LISTEN_ON environment variable for Kitty
        multiplexer_integration = nil,
        -- disable multiplexer navigation if current multiplexer pane is zoomed
        -- this functionality is only supported on tmux and Wezterm due to kitty
        -- not having a way to check if a pane is zoomed
        disable_multiplexer_nav_when_zoomed = true,
        -- Supply a Kitty remote control password if needed,
        -- or you can also set vim.g.smart_splits_kitty_password
        -- see https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
        kitty_password = nil,
        -- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
        log_level = 'info',
      },
    },
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      -- enabled = false,
      opts = {
        shell = vim.o.shell,
      }
    },
    {
      "folke/tokyonight.nvim",
      enabled = false,
      lazy = false,
      priority = 1000,          -- Ensure it loads first
      opts = {
        style = "storm",        -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
        light_style = "day",    -- The theme is used when the background is set to light
        transparent = false,    -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "storm", -- style for sidebars, see below
          floats = "storm",   -- style for floating windows
        },
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        dim_inactive = false, -- dims inactive windows
        lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        -- on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights tokyonight.Highlights
        ---@param colors ColorScheme
        -- on_highlights = function(highlights, colors) end,

        cache = true, -- When set to true, the theme will be cached for better performance

        ---@type table<string, boolean|{enabled:boolean}>
        plugins = {
          -- enable all plugins when not using lazy.nvim
          -- set to false to manually enable/disable plugins
          -- all = package.loaded.lazy == nil,
          -- uses your plugin manager to automatically enable needed plugins
          -- currently only lazy.nvim is supported
          auto = true,
          -- add any plugins here that you want to enable
          -- for all possible plugins, see:
          --   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
          -- telescope = true,
        },
      },
      -- config = function(LazyPlugin, opts)
      --   vim.cmd [[colorscheme tokyonight-storm]]
      -- end
      -- config = function(_, opts)

      -- end
    },
    {
      "chomosuke/typst-preview.nvim",
      lazy = false, -- or ft = 'typst'
      version = "1.*",
      build = function() require("typst-preview").update() end,
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
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
          marks = true,     -- shows a list of your marks on ' and `
          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          -- the presets plugin, adds help for a bunch of default keybindings in Neovim
          -- No actual key bindings are created
          presets = {
            operators = true,    -- adds help for operators like d, y, ...
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
          },
          spelling = {           -- use which-key for spelling hints
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
          rules = {},
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
            { "^%+",              "" },
            { "<[cC]md>",         "" },
            { "<[cC][rR]>",       "" },
            { "<[sS]ilent>",      "" },
            { "^lua%s+",          "" },
            { "^call%s+",         "" },
            { "^:%s*",            "" },
          },
        },
        -- ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
        show_help = true, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        debug = false,    -- enable wk.log in the current directory
      },
    }
  }
end
------------------------------------------------------------
-- Plugin Manager (Lazy)
------------------------------------------------------------
M.lazy = function(args)
  dir = dir or "plugins"
  local lazypath = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local out = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=stable",
      "https://github.com/folke/lazy.nvim.git",
      lazypath
    })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out,                            "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup(args)
end

------------------------------------------------------------
-- Language Server Protocol
------------------------------------------------------------
M.lsp = function()
  local lspconfig_defaults = require("lspconfig").util.default_config
  lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
  )

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

      bashls = function(server_name)
        require("lspconfig")["bashls"].setup({
          filetypes = { "sh", "zsh" },
        })
      end,
      lua_ls = function(server_name)
        local lsp_zero = require("lsp-zero")
        require("lspconfig")[server_name].setup({
          on_init = function(client)
            lsp_zero.nvim_lua_settings(client, {

            })
          end,
        })
      end,
    }
  })

  --[[ Completion ]]

  local cmp = require("cmp")
  local comparator = require("cmp-under-comparator")
  local cmp_action = lsp_zero.cmp_action()
  local cmp_format = lsp_zero.cmp_format({ details = true })
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
        -- require("copilot_cmp.comparators").prioritize,
        -- require("copilot_cmp.comparators").score,
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
      { name = "buffer",  keyword_length = 3 },
      { name = "copilot", group_index = 1,   priority = 100, }
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
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
      -- this is the function that loads the extra snippets
      -- from rafamadriz/friendly-snippets
      require("eagle").setup({
        border = "rounded", -- rounded, single, double, shadow
        -- override the default values found in config.lua
      })
    end,
  })
end

------------------------------------------------------------
-- Keymaps
------------------------------------------------------------
M.keymaps = function()
  --> Small fixes <--
  vim.keymap.set({ "n" }, "<esc>", ":noh<cr>", { desc = "Remove search highlights in normal mode" })
  vim.keymap.set({ "n", "x" }, "<space>", "<nop>", { desc = "Dont move cursor on space" })
  --> indentation <--
  vim.keymap.set({ "v" }, "<", "<gv", { desc = "Indent left" })
  vim.keymap.set({ "v" }, ">", ">gv", { desc = "Indent right" })
  vim.keymap.set({ "n" }, "<tab>", ">>_", { desc = "Indent left" })
  vim.keymap.set({ "n" }, "<s-tab>", "<<_", { desc = "Indent right" })
  vim.keymap.set({ "i" }, "<s-tab>", "<c-d>", { desc = "Indent right" })
  vim.keymap.set({ "v" }, "<tab>", ">gv", { desc = "Indent left" })
  vim.keymap.set({ "v" }, "<s-tab>", "<gv", { desc = "Indent right" })
  --> move lines <--
  vim.keymap.set({ "n" }, "<a-j>", ":m .+1<cr>==", { desc = "Move line down" })
  vim.keymap.set({ "n" }, "<a-k>", ":m .-2<cr>==", { desc = "Move line up" })
  vim.keymap.set({ "v" }, "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
  vim.keymap.set({ "v" }, "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
  vim.keymap.set({ "x" }, "<a-j>", ":m '>+1<cr>gv-gv", { desc = "Move line down" })
  vim.keymap.set({ "x" }, "<a-k>", ":m '<-2<cr>gv-gv", { desc = "Move line up" })
  --> move between windows <--
  vim.keymap.set({ "n" }, "<c-h>", ":SmartCursorMoveLeft<cr>",
    { desc = "Move to left window", noremap = true, silent = true })
  vim.keymap.set({ "n" }, "<c-j>", ":SmartCursorMoveDown<cr>",
    { desc = "Move to bottom window", noremap = true, silent = true })
  vim.keymap.set({ "n" }, "<c-k>", ":SmartCursorMoveUp<cr>",
    { desc = "Move to top window", noremap = true, silent = true })
  vim.keymap.set({ "n" }, "<c-l>", ":SmartCursorMoveRight<cr>",
    { desc = "Move to right window", noremap = true, silent = true })
  --> move between tabs <--
  vim.keymap.set({ "n" }, "<a-h>", ":tabprevious<cr>", { desc = "Move to left tab" })
  vim.keymap.set({ "n" }, "<a-l>", ":tabnext<cr>", { desc = "Move to right tab" })
  --> terminal mode <--
  vim.keymap.set({ "n" }, "<c-t>", ":ToggleTerm<cr>", { desc = "Toggle Terminal" })
  vim.keymap.set({ "t" }, "<c-t>", "<C-\\><C-N>:ToggleTerm<cr>", { desc = "Toggle Terminal" })
  -- vim.keymap.set({ "n" }, "<c-t>", ":Lspsaga term_toggle<cr>", { desc = "Toggle Terminal" })
  vim.keymap.set({ "n" }, "<esc>", "<C-\\><C-N>", { desc = "Escape Terminal" })
  vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-N><C-w>h", { desc = "Move to left window" })
  vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom window" })
  vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-N><C-w>k", { desc = "Move to top window" })
  vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-N><C-w>l", { desc = "Move to right window" })
  --> command mode <--
  vim.keymap.set({ "c" }, "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)",
    { noremap = false, nowait = true, desc = "Search command history" })
  vim.keymap.set({ "c" }, "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
    { expr = true, noremap = true, desc = "Move to next item" })
  vim.keymap.set({ "c" }, "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
    { expr = true, noremap = true, desc = "Move to previous item" })
  -- [[----------------]]
  -- [[ Leader Keymaps ]]
  -- [[----------------]]
  --> top-level leader <--
  vim.keymap.set({ "n" }, "<leader>e", ":Neotree filesystem toggle<cr>", { desc = "NeoTree" })
  vim.keymap.set({ "n" }, "<leader>h", ":HopWord<cr>", { desc = "Hop!" })
  vim.keymap.set({ "n" }, "<leader>Q", ":qa!<cr>", { desc = "Quit" })
  vim.keymap.set({ "n" }, "<leader>A", ":Alpha<cr>", { desc = "Alpha" })
  --> Lazy.nvim <--
  vim.keymap.set({ "n" }, "<leader>Z", ":Lazy<cr>", { desc = "Lazy" })
  --> buffers <--
  vim.keymap.set({ "n" }, "<leader>b", "Buffer", { desc = "Buffer" })
  vim.keymap.set({ "n" }, "<leader>bs", ":Neotree buffers toggle<cr>", { desc = "Show open buffers" })
  vim.keymap.set({ "n" }, "<leader>bh", ":new<cr>", { desc = "Horizonal split" })
  vim.keymap.set({ "n" }, "<leader>bv", ":vnew<cr>", { desc = "Vertical split" })
  vim.keymap.set({ "n" }, "<leader>bC", ":BufferCloseAllButCurrent<cr>", { desc = "Close all but current" })
  vim.keymap.set({ "n" }, "<leader>bd", ":BufferClose<cr>", { desc = "Close buffer" })
  vim.keymap.set({ "n" }, "<leader>bn", ":BufferNext<cr>", { desc = "Next buffer" })
  vim.keymap.set({ "n" }, "<leader>bp", ":BufferPick<cr>", { desc = "Pick buffer" })
  --> git <--
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

  --> Telescope <--
  vim.keymap.set("n", "<leader>S", "Telescope", { desc = "Telescope" })
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
  vim.keymap.set({ "n" }, "<leader>SM", ":Telescope man_pages<cr>", { desc = "Man Pages" })
  vim.keymap.set({ "n" }, "<leader>Sm", ":Telescope oldfiles<cr>", { desc = "Old files" })
  vim.keymap.set({ "n" }, "<leader>Sr", ":Telescope registers<cr>", { desc = "Registers" })
  vim.keymap.set({ "n" }, "<leader>St", ":Telescope live_grep<cr>", { desc = "Text" })
  vim.keymap.set({ "n" }, "<leader>Sk", ":Telescope keymaps<cr>", { desc = "Keymaps" })
  vim.keymap.set({ "n" }, "<leader>SC", ":Telescope commands<cr>", { desc = "Commands" })
  vim.keymap.set({ "n" }, "<leader>SL", ":Telescope loclist<cr>", { desc = "Loclist" })
  vim.keymap.set({ "n" }, "<leader>SM", ":Telescope marks<cr>", { desc = "Marks" })
  vim.keymap.set({ "n" }, "<leader>SS", ":Telescope spell_suggest<cr>", { desc = "Spell Suggest" })

  --> FZF.lua <--
  vim.keymap.set("n", "<leader>F", ":FzfLua<cr>", { desc = "fzf" })

  -- vim.keymap.set("n", "<leader>Ff", ":FzfLua files<cr>", { desc = "Files" })

  --> LSP <--
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

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      vim.keymap.set({ "n" }, "K", ":lua vim.lsp.buf.hover()<cr>", { desc = "Show hover information", buffer = buf })
      vim.keymap.set({ "n" }, "gd", ":lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition", buffer = buf })
      vim.keymap.set({ "n" }, "gD", ":lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration", buffer = buf })
      vim.keymap.set({ "n" }, "gi", ":lua vim.lsp.buf.implementation()<cr>",
        { desc = "Go to implementation", buffer = buf })
      vim.keymap.set({ "n" }, "gt", ":lua vim.lsp.buf.type_definition()<cr>",
        { desc = "Go to type definition", buffer = buf })
      vim.keymap.set({ "n" }, "gR", ":lua vim.lsp.buf.references()<cr>", { desc = "Show references", buffer = buf })
      vim.keymap.set({ "n" }, "<C-k>", ":lua vim.lsp.buf.signature_help()<cr>",
        { desc = "Show signature help", buffer = buf })
      vim.keymap.set({ "n" }, "<F2>", ":lua vim.lsp.buf.rename()<cr>", { desc = "Rename", buffer = buf })
      vim.keymap.set({ "n", "x" }, "<F3>", ":lua vim.lsp.buf.format({async = true})<cr>",
        { desc = "Format", buffer = buf })
      vim.keymap.set({ "n" }, "<F4>", ":lua vim.lsp.buf.code_action()<cr>", { desc = "Code action", buffer = buf })

      vim.keymap.set({ "n" }, "[d", ":lua vim.diagnostic.goto_prev()<cr>", { desc = "LSP Goto Previous" })
      vim.keymap.set({ "n" }, "]d", ":lua vim.diagnostic.goto_next()<cr>", { desc = "LSP Goto Next" })
      vim.keymap.set({ "n" }, "gh", ":Lspsaga finder<cr>", { desc = "LspSaga Finder" })
      vim.keymap.set({ "n" }, "gp", ":Lspsaga peek_definition<cr>", { desc = "LspSaga Peek", silent = true })
      vim.keymap.set({ "n" }, "gr", ":Lspsaga rename<cr>", { desc = "LspSaga Rename" })
      vim.keymap.set({ "n" }, "gs", ":Lspsaga signature_help<cr>", { desc = "LspSaga Signature Help" })

      -- vim.keymap.set({ "n" }, "gc", ":Lspsaga code_action<cr>", { desc = "LspSaga Code Action" })
      vim.keymap.set({ "n" }, "<leader>LSd", ":Lspsaga hover_doc<cr>", { desc = "LspSaga Hover Doc" })
      vim.keymap.set({ "n" }, "<leader>LSo", ":Lspsaga outline<cr>", { desc = "LspSaga Toggle Outline" })
    end,
  })
end
------------------------------------------------------------
-- Autocommands
------------------------------------------------------------
M.autocmds = function()
  local augroup = function(name)
    return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
  end

  vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    desc = "Highlight on yank",
    pattern = "*",
    callback = function()
      vim.highlight.on_yank { higroup = "WildMenu", timeout = 200 }
    end
  })


  vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup("json_file"),
    desc = "Wrap on enter for json files",
    pattern = { "*.json", "*.jsonc" },
    callback = function()
      vim.wo.wrap = true
    end
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("treesitter_zsh"),
    pattern = { "sh", "zsh" },
    callback = function()
      require("nvim-treesitter.highlight").attach(0, "bash")
    end
  })

  vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup("termopen"),
    desc = "TermOpen Fix",
    pattern = "*",
    callback = function()
      vim.cmd("setlocal statusline= listchars= nonumber norelativenumber")
      -- vim.cmd("startinsert")
    end
  })


  vim.api.nvim_create_autocmd("VimResized", {
    group = augroup("vimresized"),
    desc = "Auto resize windows",
    pattern = "*",
    callback = function()
      vim.cmd "wincmd ="
    end
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("fix_mini_indent"),
    desc = "Disable miniindent for NvimTree, Telescope and startup",
    -- pattern = "NvimTree,NeoTree,Telescope,Alpha,startup,neo-tree*,eagle,lspsaga,FzfLua,[No Name]",
    -- better pattern
    pattern = { "NvimTree", "Telescope", "Alpha", "startup", "eagle", "lspsaga", "FzfLua", "[No Name]" },
    callback = function()
      vim.b.miniindentscope_disable = true
    end
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaClosed",
    callback = function()
      vim.b.miniindentscope_disable = false
    end,
  })
end

return M

