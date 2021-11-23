" TODO add arrow keybindings for moving text

let mapleader = "\<BS>"
" move between open windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><left> :wincmd h<CR>
nnoremap <leader><down> :wincmd j<CR>
nnoremap <leader><up> :wincmd k<CR>
nnoremap <leader><right> :wincmd l<CR>
nnoremap <leader>ex :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <F5> :UndotreeToggle<CR>
" Sets default bindings for vim maximier which is 'F3':
let g:maximizer_set_default_mapping = 1
" Y works like D and C
nnoremap Y yg_
" staying centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" adding undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==a
inoremap <C-k> <esc>:m .-2<CR>==a
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
vnoremap <S-up> :m '<-2<CR>gv=gv
vnoremap <S-down> :m '>+1<CR>gv=gv
inoremap <C-up> <esc>:m .-2<CR>==a
inoremap <C-down> <esc>:m .+1<CR>==a
nnoremap <C-up> :m .-2<CR>==
nnoremap <C-down> :m .+1<CR>==
" replace a word then press . to change the next occurrence of it.
nnoremap cn *``cgn
nnoremap cN *``cgN
" paste then delete off clipboard
xnoremap <leader>p "_dP
" yank to global clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
" d and x are now delete without yanking
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
" leader d is now cut
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d
