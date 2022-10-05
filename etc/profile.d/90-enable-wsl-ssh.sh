# Check to make sure we've set up ssh-agent
if ! sc.exe query ssh-agent | grep 'RUNNING' > /dev/null; then
	echo "The Windows OpenSSH Agent isn't running, start it via 'wsl-enable-ssh-agent'" >&2
fi

## NB: We can't find PREFIX easily in a profile.d script so we'll need to
## try to guess what it is by running down the existing path
bindir=$(dirname `which wsl-enable-ssh-agent`)
prefix=$(realpath "$bindir/..")

## Put our symlinked OpenSSH in front of the real one
export PATH="$prefix/lib/wsl-ssh:$PATH"
