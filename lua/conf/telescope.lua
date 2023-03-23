-- telescope
-- https://github.com/nvim-telescope/telescope.nvim
local m = require('conf.mappings')
require("telescope").setup {
  defaults = {
    -- Your defaults config goes in here
    mappings = {
        i = {
            ["<Up>"] = require("telescope.actions").preview_scrolling_up,
            ["<Down>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-q>"] = require("telescope.actions").close,
            ["qqq"] = require("telescope.actions").close,
        },
        n = {
            ["q"] = require('telescope.actions').close,
        }
    },
    file_ignore_patterns = {
        "*.aseprite", "*.png", "*.jpeg", "*.fnt", "*.hl"
    },
    sorters = "fuzzy_with_index_bias",
  },
  pickers = {
    buffers = {
        sort_lastused = true,
        previewer = false,
        mappings = {
            i = {
                ["<C-d>"] = require("telescope.actions").delete_buffer,
            },
            n = {
                ["d"] = require("telescope.actions").delete_buffer,
            }
        }
    },
    find_files = {
        sorting_strategy = "descending",
        follow = true
    },
    file_browser = {
        sorting_strategy = "descending",
    },
    live_grep = {
        sorting_strategy = "descending",
    }
  },
  extensions = {
    emoji = {
      action = function(emoji)
        vim.api.nvim_put({ emoji.value }, 'c', false, true)
      end,
    }
  },
}
require("telescope").load_extension("emoji")
-- replace ctrlp
m.nmap('<C-P>', '<cmd>Telescope find_files previewer=false theme=get_dropdown<CR>')
m.nmap('<C-T><C-F>', '<cmd>Telescope find_files previewer=false theme=get_dropdown<CR>')
-- preview file
m.nmap('<C-T><C-R>', '<cmd>Telescope find_files<CR>')
-- open tags
m.nmap('<C-T><C-T>', '<cmd>Telescope current_buffer_tags theme=get_dropdown<CR>')
m.nmap('<C-T><C-J>', '<cmd>Telescope jumplist theme=get_dropdown<CR>')
-- search buffer name
m.nmap('<C-T><C-B>', '<cmd>Telescope buffers theme=get_dropdown<CR>')
-- this search symlink
-- m.nmap('<leader>tg', '<cmd>Telescope live_grep find_command=rg,--follow,--files<CR>')
-- this does not search symlink
m.nmap('<C-T><C-S>', '<cmd>Telescope live_grep<CR>')
m.nmap('<C-T><C-E><C-J>', '<cmd>Telescope emoji<CR>')
m.imap('<C-E><C-J>', '<ESC><cmd>Telescope emoji<CR>')
