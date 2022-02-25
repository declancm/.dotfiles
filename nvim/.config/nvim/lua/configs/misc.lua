-- CHADTREE:
local chadtree_settings = {
  ['theme.text_colour_set'] = 'solarized_light',
  ['options.session'] = false,
  ['options.close_on_open'] = true,
}
vim.api.nvim_set_var('chadtree_settings', chadtree_settings)

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<leader>e', '<Cmd>CHADopen<CR>', opts)
set_keymap('n', '<leader>te', '<Cmd>CHADopen<CR> --version-ctl<CR>', opts)
set_keymap('n', '<leader>qf', '<Cmd>call setqflist([])<CR>', opts)