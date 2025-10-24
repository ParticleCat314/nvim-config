return {
  -- Aurora Theme
  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    config = function()
        vim.cmd.colorscheme "aurora"
        -- override defaults
        vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})
    end
  },
  -- Bamboo Theme
  {
    "ribru17/bamboo.nvim",
  },
  
  -- CyberDream Theme
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  
  -- OneDark Theme
  {
    "navarasu/onedark.nvim",
  },
  
  -- Dracula Theme
  {
    "Mofiqul/dracula.nvim",
  },
  
  -- Gruvbox Theme
  {
    "ellisonleao/gruvbox.nvim",
    config = true,
  },
  
  -- Utilities
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
  },
  
  -- Markdown Rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
      render_modes = true, -- Render in ALL modes
      sign = {
        enabled = false,   -- Turn off in the status column
      },
    },
  },
  
  -- Transparent Background
  {
    "xiyaowong/transparent.nvim"
  }
}
