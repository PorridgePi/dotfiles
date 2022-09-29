if ! command -v librespeed-cli &> /dev/null; then
    echo 'Installing librespeed-cli'

    source $HOME/.zshenv

    if [[ "$OSNAME" == "Linux" ]]; then
        # Linux
        if [[ "$DISTRO_TYPE" == "debian" ]]; then
            # Debian-based
            if [[ "$ARCH" == "aarch64" ]]; then
                ARCH=arm64
            fi
            URL=$(curl -fsSL https://api.github.com/repos/librespeed/speedtest-cli/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep linux | grep $ARCH)
            mkdir -p $HOME/.temp/librespeed
            curl -fsSL -o $HOME/.temp/librespeed/librespeed.tar.gz "$URL"
            tar -xzf $HOME/.temp/librespeed/librespeed.tar.gz -C $HOME/.temp/librespeed/
            cp $HOME/.temp/librespeed/librespeed-cli $HOME/bin/external/
            rm -r $HOME/.temp/librespeed/
        else
            # Unknown distro
            echo 'ERROR: Unknown distro'
            echo 'Exiting...'
            exit 1
        fi
    elif [[ "$OSNAME" == "macOS" ]]; then
        # macOS
        exit 1
    else
        # Unknown
        echo 'ERROR: Unknown OS'
        echo 'Exiting...'
        exit 1
    fi
fi

echo 'librespeed-cli is installed'
