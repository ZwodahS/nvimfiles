local m = require('conf.mappings')
--[[
For testing things unti putting them in proper file
--]]
require("autoclose").setup({})

m.nmap("<leader>a", ':lua require("autoclose").toggle()<CR>')
