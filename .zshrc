# Intel (Rosetta 2) Homebrew
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# Refresh Proxy Audio Device
alias proxy-audio="sudo launchctl kickstart -k system/com.apple.audio.coreaudiod"

# Run script that reloads coreaudio
alias ka='zsh /Users/porridge/kill.sh'

# To get GPG signing to work on macOS
# export GPG_TTY=$(tty)

eval $(thefuck --alias)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
