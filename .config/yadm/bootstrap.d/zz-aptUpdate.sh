lastAptUpdateSeconds=$(date +%s -r /var/cache/apt/pkgcache.bin)
currentSeconds=$(date +%s)
diffSeconds=$(($currentSeconds - $lastAptUpdateSeconds))
echo "apt update was last run $diffSeconds second(s) ago"

# Run apt update if it has not been run for more than 30 minutes
if [[ "$diffSeconds" -gt 1800 ]]; then
    echo 'Running apt update...'
    sudo apt update
fi
