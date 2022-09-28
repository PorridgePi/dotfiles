########## Powerlevel10k instant prompt #######################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


########## Personal - Determine OS and Set Variables ##########################
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    OSNAME=Linux

    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        DISTRO=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        DISTRO=Debian
        VER=$(cat /etc/debian_version)
    else
        # Fall back to uname
        DISTRO=$(uname -s)
        VER=$(uname -r)
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    OSNAME=macOS
    VER=$(sw_vers | grep ProductVersion | cut -c 17-)
else
    # Fall back to uname
    OSNAME=$(uname -s)
    VER=$(uname -r)
fi


########## Zinit ##############################################################
### Added by Zinit's installerW
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


########## Personal - OS-Specific #############################################

if [[ "$OSNAME" == "Linux" ]]; then
    ##### Linux

elif [[ "$OSNAME" == "macOS" ]]; then
    ##### macOS
    ### Aliases
    # Intel (Rosetta 2) Homebrew
    alias ibrew='arch -x86_64 /usr/local/bin/brew'

    # Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    ##### Unknown

fi


########## Personal ###########################################################
export PATH="$HOME/bin:$PATH"
export TERM=xterm-256color
eval $(thefuck --alias)

### Aliases
# Python
alias python='python3'
alias pip='pip3'
# ls
alias ls='ls --color=auto'
alias la='ls --color=auto -A'
alias ll='ls --color=auto -laF'
# Docker Compose
alias dc='docker-compose'

# Case-insensitive autocomplete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions

# zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# zsh-history-substring-search
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true


########## pnpm ###############################################################
export PNPM_HOME="/Users/porridge/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"


########## Powerlevel10k ######################################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


########## SDKMAN! ############################################################
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
