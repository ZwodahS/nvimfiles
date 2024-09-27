-- telescope
-- https://github.com/nvim-telescope/telescope.nvim
require("telescope").setup {
	defaults = {
		-- Your defaults config goes in here
		mappings = {
			i = {
				["<Up>"] = require("telescope.actions").preview_scrolling_up,
				["<Down>"] = require("telescope.actions").preview_scrolling_down,
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-f>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
				["<C-q>"] = require("telescope.actions").close,
				["qq"] = require("telescope.actions").close,
			},
			n = {
				["q"] = require('telescope.actions').close,
			}
		},
		file_ignore_patterns = {
			"*.aseprite", "*.png", "*.jpeg", "*.fnt", "*.hl"
		},
		sorters = "fuzzy_with_index_bias",
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			previewer = false,
			mappings = {
				i = {
					["<C-d>"] = require("telescope.actions").delete_buffer,
				},
				n = {
					["d"] = require("telescope.actions").delete_buffer,
				}
			}
		},
		find_files = {
			sorting_strategy = "descending",
			follow = true
		},
		file_browser = {
			sorting_strategy = "descending",
		},
		live_grep = {
			sorting_strategy = "descending",
		}
	},
	extensions = {
		emoji = {
			action = function(emoji)
				vim.api.nvim_put({ emoji.value }, 'c', false, true)
			end,
		},
		file_browser = {
		}
	},
}
require("telescope").load_extension("emoji")
