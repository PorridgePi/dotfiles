if ! command -v gpg &> /dev/null; then
    echo 'Installing gpg'

    source $HOME/.zshenv

    if [[ "$OSNAME" == "Linux" ]]; then
        # Linux
        if [[ "$DISTRO_TYPE" == "debian" ]]; then
            # Debian-based
            sudo apt update
            sudo apt install gpg -y
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
        brew install gpg
    else
        # Unknown
        echo 'ERROR: Unknown OS'
        echo 'Exiting...'
        exit 1
    fi
fi

echo 'gpg is installed'
