local m = require('conf.mappings')
require("scrollbar").setup()

require('neo-zoom').setup({
  winopts = {
    offset = {
      width = 180,
			left = 0.3,
    }
  },
})
m.nmap('<C-W><Space>', ':NeoZoomToggle<CR>')
m.nmap('<C-W><C-Space>', ':NeoZoomToggle<CR>')
m.nmap('<C-Space>', ':NeoZoomToggle<CR>')
