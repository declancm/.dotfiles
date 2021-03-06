#!/bin/sh

export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.config/zsh/.zsh_history
setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# home and end
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# let terminal work in vim
stty start undef stop undef

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_completion "esc/conda-zsh-completion" false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'nvim $(fzf)^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

# delete start of word
bindkey "^H" backward-kill-word

# delete end of word
bindkey "^[[3;5~" kill-word

# Change zsh-autosuggestions appearance:
# tokyonight
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#565f89"
# onedark
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"
# gruvbox
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#665C54"

# FZF
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
[ -f $ZDOTDIR/completion/_cmake ] && fpath+="$ZDOTDIR/completion/"
compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

xset r rate 210 40

# Speedy keys
# xset r rate 210 40

# Environment variables set everywhere
export EDITOR="nvim"
# export TERMINAL="alacritty"
export BROWSER="firefox"

# fnm
export PATH=/home/declancm/.local/bin:$PATH
eval "`fnm env`"

alias luamake=/home/declancm/.dotfiles/nvim/.config/nvim/lsp/lua-language-server/3rd/luamake/luamake
