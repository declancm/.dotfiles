-- THEME:
-- local theme = 'tokyonight'
local theme = 'onedark'

vim.opt.background = 'dark'
vim.opt.colorcolumn = '80'

-- TOKYONIGHT_CONFIG:
if theme == 'tokyonight' then
  vim.g.tokyonight_style = 'storm'
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_italic_comments = false
  vim.cmd [[colorscheme tokyonight]]
  vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#1f2335]]
end

-- ONEDARK_CONFIG:
if theme == 'onedark' then
  require('onedark').setup {
    style = 'dark',
    transparent = true,
    code_style = {
      comments = 'none',
    },
  }
  vim.cmd [[colorscheme onedark]]
  vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#31353f]]
end

-- highlight the line number
vim.cmd [[highlight CursorLineNr guifg=white]]
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- LUALINE:
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' ',
        },
      },
      'encoding',
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { 'fugitive' },
}

-- GITSIGNS:
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    changedelete = {
      hl = 'GitSignsDelete',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
  },
}

-- TODO-COMMENTS:
require('todo-comments').setup {}

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<leader>tdt', '<Cmd>TodoTrouble<CR>', opts)
set_keymap('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', opts)

-- COLORIZER:
require('colorizer').setup()
