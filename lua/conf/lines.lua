---- Tabline configuration
-- via https://github.com/rafcamlet/tabline-framework.nvim
local colors = require("conf.theme").colors

local render = function(f)
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

	f.add({ '  ' .. errors, fg = colors.status_color.errors })
	f.add({ '  ' .. warnings, fg = colors.status_color.warnings})
	f.add({ '  ' .. hints, fg = colors.status_color.hints})

	f.add({'  ', fg = colors.status_color.fg})

	f.make_tabs(function(info)
		if info.current then
			f.add({'', fg = colors.status_color.fg, bg = colors.status_color.bg})
		else
			f.add('.')
			f.add({info.index, fg = colors.status_color.fg, bg = colors.status_color.bg})
			f.add('.')
		end

		if info.filename then
			f.add {
			' ' .. f.icon(info.filename) .. ' ',
			}
			f.add(info.filename)
			f.add(info.modified and '[+]')
		else
			f.add('        ')
		end

		if info.current then
			f.add(' ')
			f.add({'', fg = colors.status_color.fg, bg = colors.status_color.bg})
		else
			f.add(' ')
		end
	end)

	f.add_spacer()
	if vim.g.project_file then
		f.add({'', fg = colors.status_color.fg})
		f.add({'  Project Conf Loaded ', bg = colors.status_color.fg, fg = colors.status_color.white})
	end
end
require('tabline_framework').setup({
	-- Render function is resposible for generating content of tabline
	-- This is the place where you do your magic!
	render = render,
	hl = { fg = colors.status_color.fg, bg = colors.status_color.bg },
	-- Default color of selected item
	-- if not set TF uses TabLineSel highlight group colors
	hl_sel = { fg = colors.status_color.white, bg = colors.status_color.fg },
	-- Default color of everything except items
	-- if not set TF uses TabLineFill highlight group colors
	hl_fill = { fg = colors.status_color.fg, bg = colors.status_color.bg },
})

----
-- Statusline configuration
-- via https://github.com/nvim-lualine/lualine.nvim
local function mixed()
	local space_pat = [[\v^ +]]
	local tab_pat = [[\v^\t+]]
	local space_indent = vim.fn.search(space_pat, 'nwc')
	local tab_indent = vim.fn.search(tab_pat, 'nwc')
	local mixed = (space_indent > 0 and tab_indent > 0)
	local mixed_same_line
	if not mixed then
		mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
		mixed = mixed_same_line > 0
	end
	if not mixed then return '' end
	if mixed_same_line ~= nil and mixed_same_line > 0 then
		 return 'Mixed Indent @ '..mixed_same_line
	end
	local space_indent_cnt = vim.fn.searchcount({pattern=space_pat, max_count=1e3}).total
	local tab_indent_cnt =	vim.fn.searchcount({pattern=tab_pat, max_count=1e3}).total
	if space_indent_cnt > tab_indent_cnt then
		return 'Mixed Indent @ '..tab_indent
	else
		return 'Mixed Indent @ '..space_indent
	end
end
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {{'filename', path = 2, file_status = true}},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location', mixed}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {{'filename', path = 2}},
		lualine_c = {},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}
