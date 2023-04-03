-- hop
-- https://github.com/phaazon/hop.nvim
local m = require("conf.mappings");
require('hop').setup({ keys = 'qwertasdfgpoiulkjhvcbnm' })

m.nmap('J', ':HopLineAC<CR>')
m.nmap('K', ':HopLineBC<CR>')
m.nmap(',w', ':HopWordAC<CR>')
m.nmap(',b', ':HopWordBC<CR>')
