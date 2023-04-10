vim.cmd([[
augroup filetypedetect
	autocmd BufRead,BufNewFile .gitignore set filetype=conf.gitignore
	autocmd BufRead,BufNewFile *.md set filetype=markdown
	autocmd BufRead,BufNewFile *.todo set filetype=todo
	autocmd BufRead,BufNewFile *.zdoc set filetype=zdoc._
	autocmd BufRead,BufNewFile *.jop.md set filetype=zdoc._
	autocmd BufRead,BufNewFile *.hs set filetype=haxe
	autocmd BufRead,BufNewFile *.hx set filetype+=._
augroup END
]])
