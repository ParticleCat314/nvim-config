return {{
  'kaarmu/typst.vim',
  ft = 'typst',
  lazy=false,
},
  {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  opts = {
      invert_colors = 'always'

    }, -- lazy.nvim will implicitly calls `setup {}`
}


}
