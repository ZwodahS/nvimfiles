-- Lazy Plugin Manager
local lazypath = vim.fn.stdpath("config") .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.vimhome = vim.fn.stdpath("config")
vim.g.vimrc = vim.fn.stdpath("config") .. "/init.lua"
vim.g.plugins = vim.fn.stdpath("config") .. "/lua/conf/lazy.lua"

-- Load all the plugins
require("conf.lazy") -- load the plugins
require("conf.settings")
require("conf.theme").setup()

require("conf.lsp")
require("conf.hop")
require("conf.telescope")
require("conf.undotree")
require("conf.nvim-cmp")
require("conf.tag")
require("conf.jopvim")
require("conf.nvim-tree")
require("conf.vsnip")
require("conf.lines")
require("conf.autohighlight")
require("test.others")
require("conf.windowswap")
require("conf.git-gutter")
require("conf.trailing-whitespace")
require("conf.interesting_words")
require("conf.easymotion")
require("conf.colorizer")
require("conf.vaxe")
require("conf.filetypes")
require("conf.test")
require("conf.projects")
require("conf.todocomment")
