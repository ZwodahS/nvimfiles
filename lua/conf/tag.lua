local m = require('conf.mappings')

-- tag peek
-- https://github.com/semanticart/tag-peek.vim
m.nmap('<C-T><C-G>', ':call tag_peek#ShowTag()<CR>')
m.nmap('<leader>tg', ':TagbarToggle<CR>')
vim.g.tagbar_width = 30
