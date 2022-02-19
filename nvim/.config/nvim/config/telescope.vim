nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>

" Telescope Zoxide
nnoremap <leader>z <cmd>Telescope zoxide list<CR>
