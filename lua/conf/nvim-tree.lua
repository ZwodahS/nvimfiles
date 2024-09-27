vim.g.nvim_tree_refresh_wait = 500

local function on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- add your mappings
	vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
  vim.keymap.set('n', '<C-t>',   api.node.open.tab,                   opts('Open: New Tab'))
  vim.keymap.set('n', 'l',			 api.node.open.edit,                  opts('Open'))
  vim.keymap.set('n', 'n',       api.fs.create,                       opts('Create File Or Directory'))
  vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
  vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
  vim.keymap.set('n', 'm',       api.fs.cut,                          opts('Cut'))
  vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
  vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))
	-- collapse and expand is removed WTF ... time to change plugin
  vim.keymap.set('n', 'h',       api.node.navigate.parent_close,                      opts('Close'))
  vim.keymap.set('n', 'H',       api.tree.collapse_all,                      opts('Close'))
  vim.keymap.set('n', 'L',       api.tree.expand_all,                 opts('Expand All'))

end

require('nvim-tree').setup({
	actions = {
		open_file = {
			quit_on_open = false,
			resize_window = true,
		}
	},
	filesystem_watchers = {
		enable = false,
	},
	on_attach = on_attach,
	disable_netrw			 = true,
	hijack_netrw				= true,
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
		width = 49,
		side = 'right',
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

