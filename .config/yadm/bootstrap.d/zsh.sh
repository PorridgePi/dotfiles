source $HOME/.zshenv

if ! command -v zsh &> /dev/null; then
    echo 'Installing zsh'

    if [[ "$OSNAME" == "Linux" ]]; then
        # Linux
        if [[ "$DISTRO_TYPE" == "debian" ]]; then
            # Debian-based
            sudo apt update
            sudo apt install zsh -y
        elif [[ "$DISTRO_TYPE" == "rpm" ]]; then
            # RPM-based
            echo 'ERROR: Currently unsupported'
            echo 'Exiting...'
            exit 1
        elif [[ "$DISTRO_TYPE" == "arch" ]]; then
            # Arch-based
            echo 'ERROR: Currently unsupported'
            echo 'Exiting...'
            exit 1
        else
            # Unknown distro
            echo 'ERROR: Unknown distro'
            echo 'Exiting...'
            exit 1
        fi
    elif [[ "$OSNAME" == "macOS" ]]; then
        # macOS
        brew install zsh
    else
        # Unknown
        echo 'ERROR: Unknown OS'
        echo 'Exiting...'
        exit 1
    fi
fi

echo 'zsh is installed'


if [[ "$OSNAME" == "Linux" ]]; then
    # Linux
    if [ ! $(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd) = $(which zsh) ]; then
        echo 'zsh is not default shell'
        echo 'Setting zsh as default shell...'
        sudo chsh -s $(which zsh) $(whoami)
    fi
elif [[ "$OSNAME" == "macOS" ]]; then
    # macOS
    if [[ "$SHELL" == "/bin/zsh" ]]; then
        echo 'Homebrew zsh is not default shell'

        if ! brew list zsh > /dev/null ; then
            # Homebrew zsh not installed
            echo 'Installing zsh from Homebrew'
            brew install zsh
        fi
        echo 'Homebrew zsh installed'

        echo 'Setting Homebrew zsh as default shell...'
        grep -qxF "$(brew --prefix zsh)/bin/zsh" /etc/shells || sudo bash -c "echo $(brew --prefix zsh)/bin/zsh >> /etc/shells"
        sudo chsh -s "$(brew --prefix zsh)/bin/zsh" $(whoami)
    fi
else
    # Unknown
    echo 'ERROR: Unknown OS'
    echo 'Exiting...'
    exit 1
fi

echo 'zsh is default shell'
