# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward


# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi




alias history="history 0"
# enable color support of ls, less and man, and also add handy aliases
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias clip="xclip -sel clip"
alias server="python3 -m http.server"
alias thm="sudo openvpn ~/Documents/tryhackme/Yrncollo.ovpn"
alias academy="sudo openvpn ~/Documents/academy/academy-regular.ovpn"
alias htb="sudo openvpn ~/Documents/htb/lab_YrnCollo.ovpn"
alias bt="bluetoothctl power on && bluetoothctl connect 97:78:9E:7B:B0:CC"
alias create="gh issue create"
alias list="gh issue list"
alias comment="gh issue comment"
alias rotate="xrandr --output DP-2 --rotate"
# alias unda="rotate left; rotate normal"
alias vi="nvim"
alias t="tmux"
alias nano="nvim"
alias wq="exit"
alias zima="shutdown -h now"
alias ff="nvim \$(fzf --preview='cat {}')"
alias tmux="TERM=xterm-256color tmux"
alias nvimconfig="cd ~/.config/nvim/ ; nvim init.lua"
alias act="source /home/yrncollo/Desktop/python_tasks/testing/bin/activate"

export PATH="$HOME/.cargo/bin:$PATH"
# solana path
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -z $TERM ]] && export TERM=xterm-256color

PROMPT='%n@%m %1~ %# '
export XDG_RUNTIME_DIR=$HOME/"VirtualBox VMs"/
export RUNLEVEL=3

export CHROOT=$HOME/chroot
