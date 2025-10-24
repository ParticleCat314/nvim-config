return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        -- Languages to ensure are installed
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "printf",
          "python",
          "query",
          "regex",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        sync_install = false,
        ignore_install = {},
        
        -- Enable highlighting
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = true,
        },
        
        -- Enable indentation
        indent = { 
          enable = true, 
          disable = { "yaml" } 
        },
        
        -- Enable rainbow brackets (if plugin is installed)
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      })
      
      -- Document symbols keymap
      vim.keymap.set("n", "<C-s>", "<cmd>Neotree toggle document_symbols<CR>", { desc = "Toggle document symbols" })
    end,
  },
}
