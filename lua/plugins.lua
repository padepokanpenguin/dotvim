-- Plugin specifications for lazy.nvim (https://lazy.folke.io/spec).
--
-- All plugins are loaded eagerly on purpose: this config styles itself through
-- `plugin/*.rc.lua` and `after/plugin/*.rc.lua`, which are sourced once at
-- startup. Lazy-loading a plugin would make those files run before the plugin
-- exists.
--
-- Plugin sources were moved to their current maintained homes (the old
-- authors are archived / renamed upstream).

return {
  -- Colorscheme
  { 'ellisonleao/gruvbox.nvim', lazy = false, priority = 1000 },

  -- UI
  { 'nvim-tree/nvim-web-devicons' }, -- was kyazdani42/nvim-web-devicons
  { 'nvim-lualine/lualine.nvim' }, -- was hoob3rt/lualine.nvim
  { 'nvimdev/lspsaga.nvim' }, -- was glepnir/lspsaga.nvim
  { 'nvimdev/dashboard-nvim' }, -- was glepnir/dashboard-nvim (v2 API)
  { 'catgoose/nvim-colorizer.lua' }, -- was norcalli/nvim-colorizer.lua
  { 'rcarriga/nvim-notify' },

  -- Completion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'L3MON4D3/LuaSnip' },
  { 'onsails/lspkind.nvim' }, -- was onsails/lspkind-nvim

  -- LSP
  { 'neovim/nvim-lspconfig' },
  { 'mason-org/mason.nvim' }, -- was williamboman/mason.nvim
  { 'mason-org/mason-lspconfig.nvim' }, -- was williamboman/mason-lspconfig.nvim
  { 'nvimtools/none-ls.nvim' }, -- was jose-elias-alvarez/null-ls.nvim (archived)

  -- Treesitter (main branch: new API, requires Neovim 0.12+)
  { 'nvim-treesitter/nvim-treesitter', branch = 'main', lazy = false, build = ':TSUpdate' },

  -- Editing
  { 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag' },

  -- Fuzzy finding
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },

  -- Git
  { 'lewis6991/gitsigns.nvim' },
  { 'dinhhuy258/git.nvim' },

  -- Misc
  { 'wakatime/vim-wakatime' },
}
