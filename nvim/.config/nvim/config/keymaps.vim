" TODO add arrow keybindings for moving text

" improve home key
:map <Home> ^
:imap <Home> <Esc>I

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
" nnoremap <leader>ex :wincmd v<bar> :wincmd H<bar> :Ex <bar> :vertical resize 30<CR>

" tmux-like previous window switch
nnoremap <leader>; :wincmd p<CR>

" symbols outline keymap
nnoremap <leader>so :SymbolsOutline<CR>

" chadtree
nnoremap <silent> <leader>e :CHADopen<CR>
" nnoremap <silent> <leader>et :CHADopen --version-ctl<CR>
" nnoremap <silent> <leader>ec :call setqflist([])<CR>

" markdown preview
nnoremap <leader>mdp :MarkdownPreview<CR>
nnoremap <leader>mds :MarkdownPreviewStop<CR>

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
nnoremap <silent> J mzJ`z :delmarks z<CR>
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
nnoremap cn *``"_cgn
nnoremap cN *``"_cgN
" paste from global clipboard
nnoremap <leader>p "+]p
" yank to global clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
" c, d and x are now delete without yanking
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
" leader c and d is now cut
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d
nnoremap <leader>c ""c
nnoremap <leader>C ""C
vnoremap <leader>c ""c
" trouble toggle keymap
nnoremap <leader>tt :TroubleToggle<CR>
" open notes (todo.txt) from anywhere and return. Automatically git pull when
" opening and then git commit and push when closing.
nnoremap <silent> <leader>ng mZ :lcd ~/notes<CR> :silent exec "!git pull origin master > /dev/null"<CR> :edit ~/notes/notes.txt<CR>
" nnoremap <silent> <leader>nb :w<CR> :silent exec "!source ~/.config/nvim/auto-commit/commit.sh"<CR> :lcd -<CR> `Z :delmarks Z<CR>
" open notes (todo.txt) from anywhere and return.
" nnoremap <silent> <leader>ng mZ :lcd ~/notes<CR> :edit ~/notes/notes.txt<CR>
nnoremap <silent> <leader>nb :w<CR> :lcd -<CR> `Z :delmarks Z<CR>
" save, auto commit and push
nnoremap <silent> <leader>cp :!source ~/Git/git-commit-kit/commit.sh<CR>

nnoremap <silent> <expr> <leader>nt Notes_toggle()
function! Notes_toggle()
    let currentDir = getcwd(0)
    if currentDir ==# $HOME . '/notes'
        call feedkeys(":w\<CR> :lcd " . originDir . "\<CR> `Z :delmarks Z\<CR>")
    else
        let originDir = currentDir
        call feedkeys("mZ :lcd ~/notes\<CR> :silent exec \"!git pull origin master > /dev/null\"\<CR> :edit ~/notes/notes.txt\<CR>")
        " call feedkeys("mZ :lcd ~/notes\<CR> :silent exec \"!git pull $(git remote) $(git rev-parse --abbrev-ref HEAD) > /dev/null\"\<CR> :edit ~/notes/notes.txt\<CR>")
    endif
endfunction

" nnoremap <F9> :set paste<CR> "<F8>" :set topaste<CR>

" change position of cursor when pasting
noremap p gp
noremap P gP
noremap gp p
noremap gP P
