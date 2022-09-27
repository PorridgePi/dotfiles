if ! command -v python3 &> /dev/null; then
    echo 'Installing python3'
    sudo apt update
    sudo apt install python3 -y
fi

echo 'python3 is installed'

if ! command -v pip3 &> /dev/null; then
    echo 'Installing pip3'
    sudo apt update
    sudo apt install python3-pip -y
fi

echo 'pip3 is installed'
