return {
	{ "neovim/nvim-lspconfig", tag = "v1.8.0", pin = true },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"tzachar/cmp-ai",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer", -- <--- THIS ONE!
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			"onsails/lspkind.nvim",
		},
	},
}
