-- Packer setup
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  packer_bootstrap = true
  vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    packer_path,
  }
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to install plugins on startup
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd User PackerComplete, PackerFiletype sync
  augroup end
]]

-- Packer configuration
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'folke/tokyonight.nvim'

  -- Git integration
  use 'tpope/vim-fugitive'

  -- File explorer
  use 'nvim-tree/nvim-tree.lua'

  -- Status line
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'  -- optional icons for lualine

  -- Telescope (fuzzy finder)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'nvim-telescope/telescope-fzf-native.nvim'

  -- Commenting
  use 'tpope/vim-commentary'

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use 'windwp/nvim-autopairs'

  -- Git signs in the gutter
  use 'lewis6991/gitsigns.nvim'


  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Colorscheme
vim.cmd 'colorscheme tokyonight'

-- General Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard

-- Keybindings
vim.keymap.set('n', '<leader>pv', vim.cmd.NERDTreeToggle)
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)

-- Lualine Configuration
require('lualine').setup {
  options = {
    theme = 'gruvbox-dark',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
}

-- Telescope configuration
require('telescope').setup {}

-- Autopairs
require("nvim-autopairs").setup {}

-- Gitsigns
require('gitsigns').setup()

-- LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = require 'lspconfig'

lspconfig.tsserver.setup {
  capabilities = capabilities
}
lspconfig.lua_ls.setup {
  capabilities = capabilities
}
