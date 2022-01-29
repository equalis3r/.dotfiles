export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt histignorealldups

# export environments necessary for wayland session
# export LIBSEAT_BACKEND=logind
# export MOZ_ENABLE_WAYLAND=1
# export XDG_CURRENT_DESKTOP=sway
# export XDG_SESSION_TYPE=wayland
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus

# set neovim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
bindkey -v

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#292d3e,pointer:#c3e88d,info:#c3e88d,hl:#82aaff,hl+:#c3e88d'
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}" --color "border:#82aaff"'
export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS='--preview "tree -C {} | head -50"'

# nnn file terminal
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export LC_COLLATE=C
export NNN_COLORS='1234'
export NNN_PLUG='b:beautify;p:preview-tui'
export NNN_BMS="t:$HOME/drive-local/work/teaching;c:$HOME/drive-local/core-books"
export NNN_FIFO=/tmp/nnn.fifo
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
	source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

# JAVA
export JDTLS_HOME="/usr/share/java/jdtls/"

# Plugins
autoload -Uz compinit && compinit
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# emit the OSC 7 escape sequence
_urlencode() {
	local length="${#1}"
	for (( i = 0; i < length; i++ )); do
		local c="${1:$i:1}"
		case $c in
			%) printf '%%%02X' "'$c" ;;
			*) printf "%s" "$c" ;;
		esac
	done
}
osc7_cwd() {
	printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$(_urlencode "$PWD")"
}
autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd osc7_cwd

# run `alias` for full list of active aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias n="n -e"
alias ls=exa
alias cat=bat
alias grep=rg
alias cdf='cd $(fd --type directory | fzf)'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

eval "$(starship init zsh)"
eval "$(keychain --eval id_ed25519 --quiet --quick)"
