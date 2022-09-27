if ! command -v thefuck &> /dev/null; then
    bash $(dirname "$0")/python3.sh
    echo 'Installing thefuck'
    sudo pip install thefuck
fi

echo 'thefuck is installed'
