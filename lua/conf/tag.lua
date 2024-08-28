local m = require('conf.mappings')

-- tag peek
-- https://github.com/semanticart/tag-peek.vim
m.nmap('<C-T><C-G>', ':call tag_peek#ShowTag()<CR>')
m.nmap('<leader>tg', ':TagbarToggle<CR>')
vim.g.tagbar_width = 30

-- Wed 17:13:41 28 Aug 2024
-- Probably can deprecate this ? Find a way to use LSP to go do definition instead of peek
