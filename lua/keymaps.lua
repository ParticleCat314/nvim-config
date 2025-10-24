-- Additional Keymaps and Custom Functions
-- ========================================
-- Custom keymaps and utility functions

-- Utility function to create popup windows
local function popup(lines, opts)
  opts = opts or {}
  local close_events = opts.close_events
  opts.close_events = nil -- don't feed it to nvim_open_win

  opts = vim.tbl_extend("force", {
    relative = "cursor",
    row = 1,
    col = 0,
    width = 60,
    height = #lines,
    style = "minimal",
    border = "single",
    title = opts.title or "Note",
  }, opts)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  local win = vim.api.nvim_open_win(buf, false, opts)

  -- Hook events to close popup
  if close_events then
    vim.api.nvim_create_autocmd(close_events, {
      once = true, -- fire just once
      callback = function()
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
        end
      end,
    })
  end

  return win
end

-- Popup note keymap
vim.keymap.set("n", "<leader>n", function()
  local lines = {
    "Note: This is a popup window",
    "Press <Esc> to close it",
  }
  popup(lines, { 
    title = "My Popup", 
    close_events = { "BufLeave", "WinLeave", "CursorMoved", "InsertEnter" } 
  })
end, { desc = "Open a popup window with a note" })