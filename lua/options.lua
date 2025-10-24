-- Neovim Options and Core Keymaps

-- =================================

vim.deprecate = function () end

vim.g.mapleader = " "

local opt = vim.opt



-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- General Behavior
opt.wrap = false
opt.clipboard:append("unnamedplus") -- Use system clipboard
opt.mouse = "" -- Disable mouse

-- Appearance stuff
opt.fillchars = { eob = " " } -- Remove ~ from end of buffer

-- Window Split Keymaps
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Window Navigation Keymaps (fixed - no duplicate keys)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })

-- Plugin Keymaps
vim.keymap.set("n", "<C-e>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<leader>t", "<cmd>Telescope find_files<CR>", { desc = "Open Telescope" })



vim.opt.cmdheight = 1

vim.api.nvim_create_autocmd('CmdlineEnter', {
    group = vim.api.nvim_create_augroup(
        'cmdheight_1_on_cmdlineenter',
        { clear = true }
    ),
    desc = 'Don\'t hide the status line when typing a command',
    command = ':set cmdheight=1',
})

vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = vim.api.nvim_create_augroup(
        'cmdheight_0_on_cmdlineleave',
        { clear = true }
    ),
    desc = 'Hide cmdline when not typing a command',
    command = ':set cmdheight=0',
})

vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup(
        'hide_message_after_write',
        { clear = true }
    ),
    desc = 'Get rid of message after writing a file',
    pattern = { '*' },
    command = 'redrawstatus',
})




local function popup(lines, opts)
	opts = opts or {}
	local close_events = opts.close_events
	opts.close_events = nil -- don’t feed it to nvim_open_win

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

	-- ④ hook the events → close
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

vim.keymap.set("n", "<leader>n", function()
	local lines = {
		"Note: This is a popup window",
		"Press <Esc> to close it",
	}
	popup(lines, { title = "My Popup", close_events = { "BufLeave", "WinLeave", "CursorMoved", "InsertEnter" } })
end, { desc = "Open a popup window with a note" })
