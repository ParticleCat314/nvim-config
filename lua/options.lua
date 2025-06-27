-- Define user options here
local opt = vim.opt
vim.g.mapleader = " "
opt.tabstop = 2
opt.shiftwidth = 2
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.clipboard:append("unnamedplus")
opt.mouse = ""

-- Some random keymaps for vertical window splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

vim.keymap.set("n", "<C-h>", "<C-w>j", { desc = "Switch to lower window" })
vim.keymap.set("n", "<C-h>", "<C-w>k", { desc = "Switch to upper window" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })

-- Define keymaps for plugins
vim.keymap.set("n", "<C-e>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })

vim.keymap.set("n", "<leader>t", "<cmd>Telescope find_files<CR>", { desc = "Open Telescope" })

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
