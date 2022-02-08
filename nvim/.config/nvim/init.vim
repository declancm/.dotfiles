syntax on

" PRE_PLUGIN_COMMANDS:
let mapleader = "\<BS>"
set background=dark
set completeopt=menuone,noinsert,noselect

let g:python3_host_prog = '/bin/python3'
let g:python_host_prog = '/bin/python2'

" PACKER:
lua require('plugins')

" PRE_PLUGIN_CONFIGS:
source $HOME/.config/nvim/config/autocmd.vim

" PLUGIN_CONFIGS:
source $HOME/.config/nvim/config/gitblame.vim
luafile $HOME/.config/nvim/config/lspconfig.lua
source $HOME/.config/nvim/config/lspconfig.vim
" luafile $HOME/.config/nvim/config/coq.lua
luafile $HOME/.config/nvim/config/treesitter.lua
luafile $HOME/.config/nvim/config/telescope.lua
source $HOME/.config/nvim/config/telescope.vim
luafile $HOME/.config/nvim/config/refactoring.lua
luafile $HOME/.config/nvim/config/lspsaga.lua
" luafile $HOME/.config/nvim/config/cmp.lua
" source $HOME/.config/nvim/config/coc.vim
luafile $HOME/.config/nvim/config/trouble.lua
luafile $HOME/.config/nvim/config/lualine.lua
luafile $HOME/.config/nvim/config/kommentary.lua
luafile $HOME/.config/nvim/config/toggleterm.lua
luafile $HOME/.config/nvim/config/null-ls.lua
source $HOME/.config/nvim/config/design.vim
luafile $HOME/.config/nvim/config/lspcolors.lua

" POST_PLUGIN_CONFIGS:
source $HOME/.config/nvim/config/keymaps.vim
source $HOME/.config/nvim/config/function-keymaps.vim
source $HOME/.config/nvim/config/plugin-keymaps.vim

" OPTIONS:
set iskeyword-=_ " add underscore as word delimiter
set backspace=indent,eol,start,nostop
set relativenumber
set nu " add line number to the current line
set nohlsearch
set hidden
set noerrorbells " silent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent " or 'set cindent'
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch " incremental search
set termguicolors " support true colors
set scrolloff=8
" set scrolloff=999
set showmode
set signcolumn=yes
set textwidth=0
set wrapmargin=0
set cmdheight=2 " space to show two messages
set updatetime=50
set shortmess+=ac
set modifiable
set splitbelow
set splitright
set pastetoggle=<F9>
set timeoutlen=500
set mouse=nvi " scrolling in normal, visual and insert modes

" for the :find command
set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
