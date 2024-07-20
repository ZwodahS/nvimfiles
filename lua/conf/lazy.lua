--[[
-- Fri 10:29:29 24 Mar 2023
-- First migration from vimfiles.
--]]
require("lazy").setup({
	---- Lua Common library ----
	{ "nvim-lua/plenary.nvim", priority = 1000 },
	{ "MunifTanjim/nui.nvim", priority = 1000 },
	-- "nvim-lua/popup.nvim",

	---- Plugin Manager ----
	{ "folke/lazy.nvim", branch = "stable" },

	---- Themes && UI ----
	-- Theme
	{ "folke/tokyonight.nvim", branch = "main", priority = 999 },
	{ "savq/melange-nvim", priority = 999 },
	{ "sainnhe/everforest", priority = 999 },
	"ZwodahS/nvim-colorizer.lua",

	---- File Searching and Tree
	-- file explorer
	-- For some reason this constantly stop neovim from quitting properly.
	"kyazdani42/nvim-web-devicons",
	{ "kyazdani42/nvim-tree.lua", commit = "347e1eb" },

	-- Ctrlp
	-- Note: Using Ctrlp as backup for cases where the repo is too big
	"ctrlpvim/ctrlp.vim",

	---- Telescope ----
	{"nvim-telescope/telescope.nvim", branch ="0.1.x" },
	"xiyaowong/telescope-emoji.nvim",

	---- Completion Engine ----
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"ZwodahS/cmp-nvim-tags",
			{ "hrsh7th/cmp-vsnip", commit = "1ae05c6" },
		},
		priority = 300,
	},

	"folke/trouble.nvim",

	---- Statusline ----
	"rafcamlet/tabline-framework.nvim",
	"nvim-lualine/lualine.nvim",


	---- Tag ----
	"semanticart/tag-peek.vim",
	"preservim/tagbar",

	---- Lsp ----
	{ "neovim/nvim-lspconfig", priority = 100 },
	{ "williamboman/nvim-lsp-installer", priority = 99},

	---- Vim Surround ----
	"tpope/vim-surround", -- "https://github.com/tpope/vim-surround

	---- Window Management ----
	-- Swap Window
	"wesQ3/vim-windowswap", -- "https://github.com/wesQ3/vim-windowswap

	---- Trailing whitespaces ----
	-- maybe switch to this later "ntpeters/vim-better-whitespace"
	"ZwodahS/vim-trailing-whitespace",

	---- Git Related ----
	"airblade/vim-gitgutter",
	"tpope/vim-fugitive",

	---- Highlight current cursor ----
	"ZwodahS/autohighlight.vim",

	---- Hop ----
	-- Note: Easy motion is only used for "/" search as hop doesn't have that yet.
	-- Thu 20:30:34 27 Jan 2022
	-- There is currently a bug in easymotion (I think) causing undo tree to break
	-- Thu 11:40:41 03 Feb 2022
	-- Still hoping that Hop will get a / functionality like easy-motion
	-- 03 Feb 2022 RE-ORG
	"Lokaltog/vim-easymotion",
	{ "phaazon/hop.nvim", commit = "caaccee"},

	---- Undo Tree ----
	"mbbill/undotree",

	---- jopvim ----
	"ZwodahS/jopvim.nvim",

	---- Snippet library ----
	"hrsh7th/vim-vsnip",

	---- Zoom ----
	"nyngwang/NeoZoom.lua",

	---- Scrollbar ----
	"petertriho/nvim-scrollbar",

	------- Language --------
	---- Haxe ----
	{ "jdonaldson/vaxe", priority = 500 },

	---- Testing ----
	"m4xshen/autoclose.nvim",
	"vonheikemen/fine-cmdline.nvim",

	---- autoclose
}, {
	root = vim.fn.stdpath("config") .. "/plugins",
});
