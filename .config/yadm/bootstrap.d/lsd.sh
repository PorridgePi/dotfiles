if [[ "$OSNAME" == "Linux" ]]; then
    # Linux
    if [[ "DISTRO_TYPE" == "debian" ]]; then
        # Debian-based
        URL=$(curl -s https://api.github.com/repos/Peltoche/lsd/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep $(uname -m) | grep -v musl)
        curl -o /temp/lsd.deb "$URL"
        sudo dpkg -i /temp/lsd.deb
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
