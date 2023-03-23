local m = require('conf.mappings')
vim.g.windowswap_map_keys = 0 -- prevent default bindings

m.nmap("<C-W>y", ":call WindowSwap#MarkWindowSwap()<CR>")
m.nmap("<C-W>p", ":call WindowSwap#DoWindowSwap()<CR>")
