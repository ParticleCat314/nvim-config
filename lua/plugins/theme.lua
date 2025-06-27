return {
  --    'ray-x/aurora',
  --   init = function()
  --      vim.g.aurora_italic = 1
  --     vim.g.aurora_transparent = 1
  --     vim.g.aurora_bold = 1
  --   end,
  --   config = function()
  --   vim.cmd.colorscheme "aurora"
  --       -- override defaults
  --       vim.api.nvim_set_hl(0, '@number', {fg='#e933e3'})
  --    end
-- Using lazy.nvim
{
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('bamboo').setup {
      -- optional configuration here
    }
    require('bamboo').load()
  end,
},
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
  },
  { "shortcuts/no-neck-pain.nvim", version = "*" },
  { "Mofiqul/dracula.nvim" },
  { "ellisonleao/gruvbox.nvim",    config = true, opts = ... },
  -- Configure LazyVim to load dracula
  {
    "MeanderingProgrammer/render-markdown.nvim", -- Make Markdown buffers look beautiful
    ft = { "markdown", "codecompanion" },
    opts = {
      render_modes = true, -- Render in ALL modes
      sign = {
        enabled = false,   -- Turn off in the status column
      },
    },
  },
}
