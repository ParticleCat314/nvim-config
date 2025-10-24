return {
  {
    "sontungexpt/sttusline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufEnter" },
    config = function()
      require("sttusline").setup({
        statusline_color = "StatusLine",
        laststatus = 3, -- Global statusline (recommended)
        
        disabled = {
          filetypes = {
            -- Add filetypes to disable statusline here if needed
          },
          buftypes = {
            -- Add buffer types to disable statusline here if needed
          },
        },
        
        components = {
          "mode",
          "filename",
          "git-branch",
          "git-diff",
          "%=", -- Right align the following components
          "diagnostics",
          "lsps-formatters",
          "copilot",
          "indent",
          "encoding",
          "pos-cursor",
          "pos-cursor-progress",
        },
      })
    end,
  },
}
