if ! command -v librespeed-cli &> /dev/null; then
    echo 'Installing librespeed-cli'

    source $HOME/.zshenv
    if [[ "$ARCH" == "aarch64" ]]; then
        ARCH=arm64
    fi

    if [[ "$OSNAME" == "Linux" ]]; then
        # Linux
        URL=$(curl -fsSL https://api.github.com/repos/librespeed/speedtest-cli/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep linux | grep $ARCH)
        mkdir -p $HOME/.temp/librespeed
        curl -fsSL -o $HOME/.temp/librespeed/librespeed.tar.gz "$URL"
        tar -xzf $HOME/.temp/librespeed/librespeed.tar.gz -C $HOME/.temp/librespeed/
        cp $HOME/.temp/librespeed/librespeed-cli $HOME/bin/external/
        rm -r $HOME/.temp/librespeed/
    elif [[ "$OSNAME" == "macOS" ]]; then
        # macOS
        URL=$(curl -fsSL https://api.github.com/repos/librespeed/speedtest-cli/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep darwin | grep $ARCH)
        mkdir -p $HOME/.temp/librespeed
        curl -fsSL -o $HOME/.temp/librespeed/librespeed.tar.gz "$URL"
        tar -xzf $HOME/.temp/librespeed/librespeed.tar.gz -C $HOME/.temp/librespeed/
        cp $HOME/.temp/librespeed/librespeed-cli $HOME/bin/external/
        rm -r $HOME/.temp/librespeed/
    else
        # Unknown
        echo 'ERROR: Unknown OS'
        echo 'Exiting...'
        exit 1
    fi
fi

echo 'librespeed-cli is installed'
