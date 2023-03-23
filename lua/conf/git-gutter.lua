local m = require('conf.mappings')
m.nmap("<leader>hg", "GitGutterToggle<CR>")
m.nmap("<leader>hp", "GitGutterPreviewHunk<CR>")
m.nmap("<leader>hr", "GitGutterUndoHunk<CR>")
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_enabled = 0
