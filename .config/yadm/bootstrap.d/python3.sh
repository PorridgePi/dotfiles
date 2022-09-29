if ! command -v python3 &> /dev/null; then
    echo 'Installing python3'

    source $HOME/.zshenv

    if [[ "$OSNAME" == "Linux" ]]; then
        # Linux
        if [[ "$DISTRO_TYPE" == "debian" ]]; then
            # Debian-based
            sudo apt update
            sudo apt install python3 -y
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
        brew install python3
    else
        # Unknown
        echo 'ERROR: Unknown OS'
        echo 'Exiting...'
        exit 1
    fi
fi

echo 'python3 is installed'


if ! command -v pip3 &> /dev/null; then
    echo 'Installing pip3'

    source $HOME/.zshenv

    if [[ "$OSNAME" == "Linux" ]]; then
        # Linux
        if [[ "$DISTRO_TYPE" == "debian" ]]; then
            # Debian-based
            sudo apt update
            sudo apt install python3-pip -y
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
        echo 'ERROR: pip3 is not installed'
        echo 'pip3 should have been installed by Homebrew together with python3.'
        echo
        echo 'Please re-run this script or manually re-install python3 with Homebrew.'
        echo 'Exiting...'
        exit 1
    else
        # Unknown
        echo 'ERROR: Unknown OS'
        echo 'Exiting...'
        exit 1
    fi
fi

echo 'pip3 is installed'
