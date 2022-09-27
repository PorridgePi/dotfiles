if ! command -v gpg &> /dev/null; then
    echo 'Installing gpg'
    sudo apt update
    sudo apt install gpg -y
fi

echo 'gpg is installed'
