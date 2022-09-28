if ! command -v lsd &> /dev/null; then
    echo 'Installing lsd'

    if [[ "$OSNAME" == "Linux" ]]; then
        # Linux
        if [[ "$DISTRO_TYPE" == "debian" ]]; then
            # Debian-based
            if [[ "$ARCH" == "aarch64" ]]; then
                ARCH=arm64
            fi
            URL=$(curl -s https://api.github.com/repos/Peltoche/lsd/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep $ARCH | grep -v musl)
            mkdir -p ~/.temp
            curl -L -o ~/.temp/lsd.deb "$URL"
            sudo dpkg -i ~/.temp/lsd.deb
            rm ~/.temp/lsd.deb
        else
            # Unknown distro
            echo 'ERROR: Unknown distro'
            echo 'Exiting...'
            exit 1
        fi
    elif [[ "$OSNAME" == "macOS" ]]; then
        # macOS
        brew install lsd
    else
        # Unknown
        echo 'ERROR: Unknown OS'
        echo 'Exiting...'
        exit 1
    fi
fi

echo 'lsd is installed'
