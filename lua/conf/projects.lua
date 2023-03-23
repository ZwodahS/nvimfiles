-- source directory specific file.
-- This is dangerous when opening new repo from unknown origin so we put a hash
-- that is local to the machine that is never committed.
vim.g.project_hash = ""
require("local") -- this is never committed, project_hash is also set there

vim.cmd([[
let $localfile=join([getcwd(), "/.project.", g:project_hash, ".vim"], '')
if (g:project_hash != '' && filereadable($localfile))
    source $localfile
    let g:project_file = 1
endif
]])
