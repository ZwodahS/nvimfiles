local m = require('conf.mappings')

require("todo-comments").setup({
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIXME = { icon = " ", color = "error" },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning", alt = {"WEIRD", "WHY"} },
    OPTIMIZE = { icon = " " },
    NOTE = { icon = " ", color = "hint", alt = { "INFO", "IDEA", "QUESTION" } },
		ISTOPHERE = { icon = " ", color = "stophere", alt = { "HERE" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = false, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" },
		stophere = { "STOPHERE", "#FFC88B" }
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
})

m.nmap("<C-t><C-r>", "<cmd>TodoTelescope keywords=ISTOPHERE,HERE<CR>")
m.nmap("<C-t><C-t>", "<cmd>TodoTelescope keywords=TODO<CR>")
m.nmap("<C-t><C-d>", "<cmd>TodoTelescope<CR>")
m.nmap("<C-t><C-f>", "<cmd>TodoLocList<CR>")
m.nmap("]t", '<cmd>lua require("todo-comments").jump_next()<CR>')
m.nmap("[t", '<cmd>lua require("todo-comments").jump_prev()<CR>')
