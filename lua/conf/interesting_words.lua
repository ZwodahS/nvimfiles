vim.cmd([[
"""" Interesting words, taken from https://github.com/nicknisi/dotfiles
function! Match(word, color)
	" Calculate an arbitrary match ID.	Hopefully nothing else is using it.
	let mid = 171959 + a:color
	" Clear existing matches, but don't worry if they don't exist.
	silent! call matchdelete(mid)
	" Construct a literal pattern that has to match at boundaries.
	let pat = '\V\<' . escape(a:word, '\') . '\>'
	" Actually match the words.
	call matchadd("InterestingWord" . a:color, pat, 1, mid)
endfunction

function! HiInterestingWord(n)
	let word = expand('<cword>')
	call Match(word, a:n)
endfunction

]])
-- TODO: switch to https://github.com/lfv89/vim-interestingwords ?
