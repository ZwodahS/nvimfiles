-- CtrlP ignore
vim.cmd("set wildignore+=*.swp")
vim.cmd("set wildignore+=*.zip,*.jar,*.tar")
vim.cmd("set wildignore+=venv,venv3,__pycache__,*.pyc")
vim.cmd("set wildignore+=node_modules")
vim.cmd("set wildignore+=*.class")

vim.g.ctrlp_switch_buffer=""
vim.g.ctrlp_map=''

vim.cmd([[
if executable('ag')
" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor --follow -g ""'
endif
if has('nvim') != 0
	nnoremap <leader>p :CtrlP .<CR>
	nnoremap <C-S-P> :CtrlP<CR>
else
	nnoremap <C-S-P> :CtrlP<CR>
	nnoremap <C-P> :CtrlP .<CR>
endif
]])
