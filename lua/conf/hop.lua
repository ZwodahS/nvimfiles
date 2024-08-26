local m = require("conf.mappings");
require('hop').setup({ keys = 'qwertasdfgpoiulkjhvcbnm' })

m.nmap('J', ':HopLineAC<CR>')
m.nmap('K', ':HopLineBC<CR>')
m.nmap(',w', ':HopWordAC<CR>')
m.nmap(',b', ':HopWordBC<CR>')

-- Use Easy Motion for / because hop doesn't do what I want
m.nmap("/", "<Plug>(easymotion-sn)")
vim.g.EasyMotion_keys = "qwertasdfgpoiulkjhvcbnm"
