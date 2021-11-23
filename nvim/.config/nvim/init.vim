syntax on

" TODO go over the keybinds
" TODO go over settings for cmp and vsnips and personalize
" TODO learn how to use vsnips
" TODO ensure that fzy is functioning correctly

" setting up vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'tami5/lspsaga.nvim'
" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" vsnips
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" fzf
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-rooter'
" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" undo tree
Plug 'mbbill/undotree'
" git
Plug 'tpope/vim-fugitive'
" theme and colors
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
" the debugger plugins
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
" CoC auto completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'kevinoid/vim-jsonc'
Plug 'unblevable/quick-scope'
Plug 'honza/vim-snippets'
call plug#end()

source $HOME/.config/nvim/keymaps.vim
source $HOME/.config/nvim/autocmd.vim
" source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
" source $HOME/.config/nvim/plug-config/snippets.vim
" source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/design.vim
luafile $HOME/.config/nvim/plug-config/lspconfig.lua
source $HOME/.config/nvim/plug-config/lspconfig.vim
luafile $HOME/.config/nvim/plug-config/compeconfig.lua
luafile $HOME/.config/nvim/plug-config/treesitter.lua
source $HOME/.config/nvim/plug-config/treesitter.vim
luafile $HOME/.config/nvim/plug-config/telescope.lua
source $HOME/.config/nvim/plug-config/telescope.vim
luafile $HOME/.config/nvim/plug-config/lspsaga.lua
source $HOME/.config/nvim/plug-config/lspsaga.vim
luafile $HOME/.config/nvim/plug-config/cmp.lua
source $HOME/.config/nvim/plug-config/vsnips.vim

set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set showmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set textwidth=0
set wrapmargin=0
set cmdheight=2
set updatetime=50
set shortmess+=c

let g:python3_host_prog = '/bin/python3'
let g:python_host_prog = '/bin/python2'

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"