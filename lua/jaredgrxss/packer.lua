-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Telescope for grepping
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })
    use({"rebelot/kanagawa.nvim"})
	-- Treesitter
	use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
	-- Playground for treesitter 
	use('nvim-treesitter/playground')
	-- Advanced Undo Functionality
	use('mbbill/undotree')
	-- Fugitive
	use('tpope/vim-fugitive')
	-- LSP Configuration 
	use({
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	})
	use({'williamboman/mason-lspconfig.nvim'})
	use({'neovim/nvim-lspconfig'})
	use({'hrsh7th/nvim-cmp'})
	use({'hrsh7th/cmp-nvim-lsp'})
	use({'L3MON4D3/LuaSnip'})           -- Snippet engine
	use({'saadparwaiz1/cmp_luasnip'})   -- LuaSnip completion source
	use({'hrsh7th/cmp-buffer'})      -- Optional: buffer words
	use({'hrsh7th/cmp-path'})           -- Optional: path completion
    -- Ruby END block completion
    use({'RRethy/nvim-treesitter-endwise'})
    -- JS / TS parethensis completion
    use({'windwp/nvim-autopairs'})

    -- commenting out multiple lines
    use({'tpope/vim-commentary'})
    -- file explorer
    use({
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    })
end)

