require('telescope').setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.65,
      horizontal = {
        size = {
          width = "95%",
          height = "95%",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    },
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })