# macOS ONLY

source $HOME/.zshenv

if [[ "$OSNAME" == "macOS" ]]; then
    # macOS
    if ! command -v brew &> /dev/null; then
        echo 'Installing Homebrew'
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    echo 'Homebrew is installed'
fi
