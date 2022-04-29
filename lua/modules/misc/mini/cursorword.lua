return function()
  _G.cursorword_blocklist = function()
    local curword = vim.fn.expand('<cword>')
    local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

    -- Add any disabling global or filetype-specific logic here
    local blocklist = { "Starter" }
    if filetype == 'lua' then
      blocklist = { 'local', 'require' }
    elseif filetype == 'javascript' then
      blocklist = { 'import' }
    end

    vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
  end

  -- Make sure to add this autocommand *before* calling module's `setup()`.
  vim.cmd([[au CursorMoved * lua _G.cursorword_blocklist()]])
  -- vim.cmd([[:hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE]])
  local ok, cursorword = pcall(require, "mini.cursorword")
  if not ok then
    return
  end
  cursorword.setup({
    -- Delay (in ms) between when cursor moved and when highlighting appeared
    delay = 100,
  })
end
