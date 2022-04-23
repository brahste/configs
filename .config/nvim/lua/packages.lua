require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  -- Themes
  use {
    'EdenEast/nightfox.nvim'
  }
  use 'vimwiki/vimwiki'            -- Add more about the VIM Wiki!
  use 'tpope/vim-commentary'       -- Simple block commenting with `gcc` and `gc`
  use 'windwp/nvim-autopairs'      -- Dynamic braces matching and spacing
  use 'mhinz/vim-signify'          -- Annotates added, removed, and modified lines
  use { 'hoob3rt/lualine.nvim' }   -- Statusline plugin
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        local alpha = require'alpha'
        local startify = require'alpha.themes.startify'
        startify.section.bottom_buttons.val = {
          startify.button("e", "new file", ":ene <bar> startinsert <CR>"),
          startify.button("c", "neovim config", ":e ~/.config/nvim/init.lua<CR>"),
          startify.button("z", "zshrc config", ":e ~/.zshrc<CR>"),
          startify.button("g", "git config", ":e ~/.gitconfig<CR>"),
          startify.button("q", "quit", ":qa<CR>"),
	}
        alpha.setup(startify.config)
    end
  }

  -- IDE plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use { 'L3MON4D3/LuaSnip', requires = {'honza/vim-snippets'} }
  use {
    'neovim/nvim-lspconfig',             -- Native neovim LSP support
  }
  use 'mhartington/formatter.nvim'
  use { 'kdheepak/lazygit.nvim' }
  use 'simrat39/rust-tools.nvim'
  use {
    'hrsh7th/cmp-nvim-lsp',              -- Variety of completion plugins
    'hrsh7th/cmp-nvim-lua',              -- Variety of completion plugins
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  }
  -- use {
  --   'hrsh7th/cmp-vsnip',
  --   'hrsh7th/vim-vsnip',
  -- }
  use { 
    'nvim-telescope/telescope.nvim',    
    requires = 
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-lua/plenary.nvim' }
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }
end)

