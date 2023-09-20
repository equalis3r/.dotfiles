export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt histignorealldups

# Editor
export VISUAL=nvim
export EDITOR="$VISUAL"
bindkey -v

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#292d3e,pointer:#c3e88d,info:#c3e88d,hl:#82aaff,hl+:#c3e88d'
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}" --color "border:#82aaff"'
export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS='--preview "tree -C {} | head -50"'

# nnn file manager
export NNN_FCOLORS="0B0B04060006060009060B06"
export LC_COLLATE=C
export NNN_COLORS='1234'
export NNN_PLUG='b:beautify'
export NNN_BMS="t:$HOME/drive-local/work/teaching;c:$HOME/drive-local/core-books"
export NNN_FIFO=/tmp/nnn.fifo
if [ -f ~/.config/nnn/quitcd.bash_zsh ]; then
	source ~/.config/nnn/quitcd.bash_zsh
fi

# JAVA
export JDTLS_HOME="/usr/share/java/jdtls/"

# Plugins
autoload -Uz compinit && compinit
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# For a full list of active aliases, run `alias`.
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias find=fd
alias ls=eza
alias cat=bat
alias grep=rg
alias hx=helix
alias zt="zathura --fork"
alias cdf='cd $(fd --type directory | fzf)'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

eval $(starship init zsh)
eval "$(zoxide init zsh)"
eval $(keychain --eval id_ed25519 --quiet --quick)
