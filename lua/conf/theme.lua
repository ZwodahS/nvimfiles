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
-- Currently supports "melange" and "tokyonight"
-- Note to self: remember to change alacritty and tmux theme
-- local colorscheme = "tokyonight"
local colorscheme = "melange"
local M = {}

M.setup = function ()

  --[[
  -- Mon 13:25:23 03 Apr 2023
  -- Tokyonight allow us to extend the color scheme, so we will just use it
  -- To extends Melange, we will manually do it.
  -- Honestly, we might want to put them together later
  --
  -- We should copy the tokyonight utility here
  --]]
  if colorscheme == "tokyonight" then
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = true
    local c = require("tokyonight.colors").setup({})
    local util = require("tokyonight.util")

    -- additional colors
    local extensions = {
      ZDatetime = { fg = blend(c.comment, c.fg, 0.3), style = "bold"},
      ZStop = { fg = "#FF0000" },
      ZSpecialRed = { fg = c.red1 },
      ZSpecialGreen = { fg = c.green1 },
      ZCommentSpecial1 = { fg = blend(c.red1, c.bg, .8) , style = "italic" },
      ZCommentSpecial2 = { fg = blend(c.green, c.bg, .8) , style = "italic" },
      CommentNearInvisible = { fg = blend(c.comment, c.bg, .2) },
      PMenu = { fg = c.fg },
      PMenuSel = { fg = c.fg, bg = c.blue },

      HopNextKey = { fg = c.green, style = "bold" },
      HopNextKey1 = { fg = c.yellow, style = "bold" },
      HopNextKey2 = { fg = c.orange },
      HopUnmatched = { fg = c.dark2 },
    }
    util.syntax(extensions);

    M.colors = {
      fg = c.fg,
      bg = c.bg,
      red = c.red1,
      green = c.green1,
      blue = c.blue,
      status_color = {
        bg = c.bg,
        fg = c.blue,
        white = c.fg,

        errors = c.red,
        warnings = c.yellow,
        hints = c.green,

      }
    }
  elseif colorscheme == "melange" then
  end

  vim.opt.termguicolors = true
  vim.cmd.colorscheme(colorscheme)

  -- Post loading configuration
  if colorscheme == "tokyonight" then
  elseif colorscheme == "melange" then
    local c = require("melange.palettes.dark")
    local melange_extensions = {
      ZDatetime = { fg = blend(c.b.blue, c.a.com, 0.6) },
      ZStop = { fg = "#FF0000" },
      ZSpecialRed = { fg = c.b.red },
      ZSpecialGreen = { fg = c.b.green },
      ZCommentSpecial1 = { fg = blend(c.b.red, c.a.bg, .8) },
      ZCommentSpecial2 = { fg = blend(c.b.green, c.a.bg, .8) },
      CommentNearInvisible = { fg = blend(c.a.com, c.a.bg, .2) },
      PMenu = { fg = c.a.fg },
      PMenuSel = { fg = c.a.fg, bg = c.b.red },

      HopNextKey = { fg = c.b.green, bold = true },
      HopNextKey1 = { fg = c.b.yellow, bold = true },
      HopNextKey2 = { fg = c.b.cyan },
      HopUnmatched = { fg = c.b.blue },
    }

    -- Enable these for Melange
    for name, attrs in pairs(melange_extensions) do
      if type(attrs) == 'table' then
        vim.api.nvim_set_hl(0, name, attrs)
      elseif type(attrs) == 'string' then
        vim.api.nvim_set_hl(0, name, { link = attrs })
      end
    end

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
end

return M;
