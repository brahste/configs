# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
        fzf
)


source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#-----
# User configuration

# Show nothing about user@comp on prompt
prompt_context() {}

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# For OOR usage
# Quick access ssh and sftp aliases
# alias sshdx1="ssh root@172.25.143.248"
# alias sshdx1jetson="ssh ava@172.25.248.213"
alias sshdx1proxy="ssh -fND 9001 root@172.25.143.248"
alias sshdx1decimus="ssh -o ProxyCommand='/usr/bin/nc -x 127.0.0.1:9001 %h %p' root@192.168.168.203"
alias sftpdx1decimus="sftp -o ProxyCommand='/usr/bin/nc -x 127.0.0.1:9001 %h %p' root@192.168.168.203"
alias pingdx1="ping 172.25.143.248"

# alias dx2a="khadas@172.25.112.71"
# alias dx2b="khadas@172.25.52.119"

# alias sshdx3="ssh root@172.25.212.230"
# alias sshdx3jetson="ssh jeeves@172.25.231.57"
alias sshdx3proxy="ssh -fND 9003 root@172.25.212.230"
alias pingdx3="ping 172.25.212.230"

# alias sshbed="ssh khadas@172.25.119.133"
alias pingbed="ping 172.25.119.133"

# Quick directory changes
alias cdp="cd ~/proj"

alias cdv="cdv ~/dev"

# Quick access to dotfiles 
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/init.lua"
alias nvimswaps="cd $HOME/.local/share/nvim/swap"

# Aliases for programs and applications
alias python="python3"
alias vim="nvim"
alias trezor="cd $HOME/Applications/Trezor && ./Trezor-Suite-21.12.2-linux-x86_64.AppImage"
alias pycharm="bash $HOME/Applications/pycharm-community-2021.3.1/bin/pycharm.sh"
# Misc aliases
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -la"
alias watch="watch --color"

# Alias for dotfile configuration management with git
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom ls colour with vivid
export LS_COLORS="$(vivid generate molokai)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
