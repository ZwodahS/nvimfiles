--- Utility functions
local function hexToRgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end
---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function blend(foreground, background, alpha)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = hexToRgb(background)
	local fg = hexToRgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

----- Colorscheme
-- Currently supports "melange" | "everforest" | "tokyonight"
-- Melange is "RED", everforest is "Green", tokyonight is "Blue"
-- Note to self: remember to change alacritty and tmux theme
local colorscheme = "melange"
local M = {}

M.setup = function ()
	vim.opt.termguicolors = true
	vim.cmd.colorscheme(colorscheme)

	local extensions = {}

	-- Post loading configuration
	if colorscheme == "melange" then
		local c = require("melange.palettes.dark")
		-- add orange
		c.b.orange = blend(c.b.red, c.b.yellow, 0.5);
		c.b.dark = blend(c.a.bg, c.a.fg, 0.3);
		c.b.darkred = blend(c.b.red, c.a.bg, 0.5);

		extensions = {
			ZDatetime = { fg = blend(c.b.blue, c.a.com, 0.6) },
			ZStop = { fg = "#FF0000" },
			ZSpecialRed = { fg = c.b.red, },
			ZSpecialDarkRed = { fg = c.b.darkred, },
			ZSpecialGreen = { fg = c.b.green },
			ZSpecialYellow = { fg = c.b.yellow },
			ZSpecialCyan = { fg = c.b.cyan },
			ZCommentSpecial1 = { fg = blend(c.b.red, c.a.bg, .8) },
			ZCommentSpecial2 = { fg = blend(c.b.green, c.a.bg, .8) },
			CommentNearInvisible = { fg = blend(c.a.com, c.a.bg, .2) },
			PMenu = { fg = c.a.fg, bg = blend(c.a.bg, c.a.fg, .9) },
			PMenuSel = { fg = c.a.fg, bg = c.b.red },
			STOPHERE = { fg = c.b.black, bg = "#FFC88B" },

			HopNextKey = { fg = c.b.green, bold = true },
			HopNextKey1 = { fg = c.b.yellow, bold = true },
			HopNextKey2 = { fg = c.b.cyan },
			HopUnmatched = { fg = c.b.blue },

			InterestingWord1 = { fg = c.a.bg, bg = c.b.orange },
			InterestingWord2 = { fg = c.a.bg, bg = c.b.blue },
			InterestingWord3 = { fg = c.a.bg, bg = c.b.green },
			InterestingWord4 = { fg = c.a.bg, bg = c.b.red },
			InterestingWord5 = { fg = c.a.bg, bg = c.b.cyan },
			InterestingWord6 = { fg = c.a.bg, bg = c.b.magenta },

			-- Melange did not specify these, so we need to do it manually
			-- Cmp - copied from Tokyonight. There are more so the rest should be added when needed
			CmpItemKindDefault = { fg = c.a.dark },
			CmpItemKindKeyword = { fg = c.b.cyan },

			CmpItemKindVariable = { fg = c.b.magenta },
			CmpItemKindConstant = { fg = c.b.magenta },
			CmpItemKindReference = { fg = c.b.magenta },
			CmpItemKindValue = { fg = c.b.magenta },

			CmpItemKindFunction = { fg = c.b.blue },
			CmpItemKindMethod = { fg = c.b.blue },
			CmpItemKindConstructor = { fg = c.b.blue },

			CmpItemKindClass = { fg = c.b.orange },
			CmpItemKindInterface = { fg = c.b.orange },
			CmpItemKindStruct = { fg = c.b.orange },
			CmpItemKindEvent = { fg = c.b.orange },
			CmpItemKindEnum = { fg = c.b.orange },
			CmpItemKindUnit = { fg = c.b.orange },

			CmpItemKindModule = { fg = c.b.yellow },

			CmpItemKindProperty = { fg = c.b.green },
			CmpItemKindField = { fg = c.b.green },
			CmpItemKindTypeParameter = { fg = c.b.green },
			CmpItemKindEnumMember = { fg = c.b.green },
			CmpItemKindOperator = { fg = c.b.green },
			CmpItemKindSnippet = { fg = c.b.dark },
		}

		-- Enable these for Melange
		M.colors = {
			fg = c.a.fg,
			bg = c.a.bg,
			red = c.b.red,
			green = c.b.green,
			blue = c.b.blue,
			status_color = {
				bg = c.a.bg,
				fg = '#9a6062',
				white = c.a.fg,

				errors = c.b.red,
				warnings = c.b.yellow,
				hints = c.b.green,
			}
		}
	end

	for name, attrs in pairs(extensions) do
		if type(attrs) == 'table' then
			vim.api.nvim_set_hl(0, name, attrs)
		elseif type(attrs) == 'string' then
			vim.api.nvim_set_hl(0, name, { link = attrs })
		end
	end
end

return M;
