local m = require('conf.mappings')

vim.g.nvim_tree_refresh_wait = 500

require('nvim-tree').setup({
	actions = {
		open_file = {
			quit_on_open = false,
			resize_window = true,
		}
	},
	disable_netrw			 = true,
	hijack_netrw				= true,
	open_on_setup			 = false,
	ignore_ft_on_setup	= {},
	open_on_tab				 = false,
	hijack_cursor			 = false,
	update_cwd					= false,
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	update_focused_file = {
		enable			= false,
		update_cwd	= false,
		ignore_list = {}
	},
	system_open = {
		cmd	= nil,
		args = {}
	},
	filters = {
		dotfiles = false,
		custom = {}
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 40,
		hide_root_folder = false,
		side = 'left',
		mappings = {
			custom_only = true,
			-- default mappings
			list = {
				{ key = {"<CR>"}, action = "edit_no_picker" },
				{ key = "<C-v>",												action = "vsplit" },
				{ key = "<C-x>",												action = "split" },
				{ key = "<C-t>",												action = "tabnew" },
				{ key = "<",														action = "prev_sibling" },
				{ key = ">",														action = "next_sibling" },
				{ key = "P",														action = "parent_node" },
				{ key = "h",														action = "close_node" },
				{ key = "l",														action = "dir_open" },
				{ key = "<Tab>",												action = "preview" },
				{ key = "R",														action = "refresh" },
				{ key = "n",														action = "create" },
				{ key = "d",														action = "remove" },
				{ key = "D",														action = "trash" },
				{ key = "r",														action = "rename" },
				{ key = "m",														action = "cut" },
				{ key = "c",														action = "copy" },
				{ key = "p",														action = "paste" },
				{ key = "q",														action = "close" },
			}
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes"
	},
	respect_buf_cwd = false,
	create_in_closed_folder = false,
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
			},
			padding = ' ',
			symlink_arrow = " >> ",
			glyphs = {
				default = '',
				symlink = '',
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌"
				},
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				}
			}
		},
		add_trailing = true,
		highlight_opened_files = "0",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true
	}
})

m.nmap("<leader>f", ":NvimTreeFocus <CR>")
m.nmap("<leader>F", ":NvimTreeFindFile<CR>:NvimTreeFocus<CR>")
