-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use("folke/tokyonight.nvim")

	-- Vim-Tmux navigation with Vim keys (HJKL)
	use("christoomey/vim-tmux-navigator")

	-- Commenter
	use("numToStr/Comment.nvim")

	-- File explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- file icons
		},
	})

	-- Lua Statusline
	use("nvim-lualine/lualine.nvim")

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- All LSP plugins
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },

			-- Lsp UIs
			-- { "glepnir/lspsaga.nvim", commit = "b7b4777369b441341b2dcd45c738ea4167c11c9e" },
			{ "glepnir/lspsaga.nvim" },

			-- Nice lsp icons
			{ "onsails/lspkind.nvim" },

			-- Linting like prettier
			{ "jose-elias-alvarez/null-ls.nvim" },
			-- {'jay-babu/mason-null-ls.nvim'},
		},
	})

	-- treesitter for better syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- auto closing tags
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git integration with nice icons
	use("lewis6991/gitsigns.nvim")
end)
