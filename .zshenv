########## Personal - Determine OS and Set Variables ##########################
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    OSNAME=Linux

    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        DISTRO=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        DISTRO=Debian
        VER=$(cat /etc/debian_version)
    else
        # Fall back to uname
        DISTRO=$(uname -s)
        VER=$(uname -r)
    fi

    if command -v dpkg &> /dev/null; then
        # Debian-based
        DISTRO_TYPE=debian
    elif command -v yum &> /dev/null; then
        # RPM-based
        DISTRO_TYPE=rpm
    elif command -v pacman &> /dev/null; then
        # Arch-based
        DISTRO_TYPE=arch
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    OSNAME=macOS
    VER=$(sw_vers | grep ProductVersion | cut -c 17-)
else
    # Fall back to uname
    OSNAME=$(uname -s)
    VER=$(uname -r)
fi

ARCH=$(uname -m)

export OSNAME DISTRO DISTRO_TYPE VER ARCH

# Rust
. "$HOME/.cargo/env"
