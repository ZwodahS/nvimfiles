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

" Somehow this does not work :(
" It means that I will need to put this in each language in the after
"augroup syntaxchange2
"    autocmd BufRead,BufNewFile *.hx syn match ZDatetime "\(Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun\) \(\d\d:\d\d:\d\d\) \d\+ \(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\d\d\d"
"    autocmd BufRead,BufNewFile *.hx syn keyword ZStop ISTOPHERE
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial1 "@fixme"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial1 "@hack"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial1 "@todo"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial1 "@remember"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial2 "@idea"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial2 "@future"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial2 "@thoughts"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial2 "@balance"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial2 "@question"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial2 "@backward"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial2 "@introduce"
"    autocmd BufRead,BufNewFile *.hx syn match ZCommentSpecial2 "@assumption"
"augroup END

augroup autostart
    autocmd TabNew * TagbarToggle
    autocmd VimEnter * TagbarToggle
augroup END
]])
