if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by phara for 5.9

autoload -Uz compinit
compinit

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'

alias vencord='sh -c "$(curl -sS https://vencord.dev/install.sh)"'
alias rscfg='killall waybar && hyprctl dispatch exec waybar && hyprctl reload && swaync-client --reload-config --reload-css'
alias root='sudo su'
alias cat='bat'
alias ls='lsd'
alias uwu='clear && uwufetch'
alias ff='fastfetch'
alias cls='clear && fastfetch'
alias c='clear'
alias q='exit'
alias p='pwd'

alias update='sudo pacman -Syu'
alias rds='sudo pacman -Rds $(pacman -Qdtq)'

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_DELAY=0

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh