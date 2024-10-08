local cmp = require('cmp')
local compare = require('cmp.config.compare')
local types = require('cmp.types')

-- is there a better way to set this ?
vim.g.compe = {}
vim.g.compe.min_length = 1

-- TODO, generalise this use a table to sort the types
local type_sort = function(entry1, entry2)
	local kind1 = entry1:get_kind()
	kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
	local kind2 = entry2:get_kind()
	kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
	if kind1 ~= kind2 then
		if kind1 == types.lsp.CompletionItemKind.Snippet then
			return false
		end
		if kind2 == types.lsp.CompletionItemKind.Snippet then
			return true
		end
		local diff = kind1 - kind2
		if diff < 0 then
			return true
		elseif diff > 0 then
			return false
		end
	end
end

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = {
			['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
			['<C-J>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
			['<C-K>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
	},
	sorting = {
		comparators = {
			type_sort,
			compare.offset,
			compare.exact,
			compare.score,
			compare.recently_used,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},
	sources = cmp.config.sources({
		{ name = 'vsnip' }, -- For vsnip users.
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = 'tags' },
		-- { name = 'buffer' },
	}, {
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
