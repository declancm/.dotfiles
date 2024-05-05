vim.g.python3_host_prog = '/bin/python3' -- Specify python3 path to make startup faster.
vim.loader.enable()                      -- Enable the lua module loader.
vim.g.mapleader = ' '                    -- Set the keymap leader.

require('options')

require('config.lazy')
require('config.lsp')
require('config.telescope')
require('config.treesitter')
require('config.visuals')
require('config.misc')
require('config.sessiondir')

require('commands')
require('autocmds')
require('keymaps')
