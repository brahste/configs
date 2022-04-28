require('packages')
  require('_treesitter')
  require('_nvim-lspconfig')
  require('_barbar')
  require('_cmp')  
  require('_nvim-tree')
  require('_nvim-autopairs')
  require('_rust-tools')
  require('_formatter')
  require('_luasnip')
require('configuration')
require('colorscheme')
require('keybindings')

require('telescope').setup{}
-- require('telescope').load_extension('fzf')
-- require('telescope').load_extension('project')

require('lualine').setup{
    options = {theme = 'nightfly'}
}

require("luasnip.loaders.from_snipmate").lazy_load()
