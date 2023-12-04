#!/bin/bash
# bash hangs vim
set -eu

user=$SUDO_USER
tmp=$1
cmd=$2
cmd=$(printf %q "$cmd")

# at least youcomplete me requires lo...
/usr/bin/ip link set lo up
# TODO visible in /etc
/usr/bin/hostname com
#TODO mount /run/user
/usr/bin/mount -o bind,noexec,nosuid,nodev "$tmp" /tmp
shell=$(/usr/bin/getent passwd "$user" | /usr/bin/cut -d: -f7)
shell=$(printf %q "$shell")
tmp=$(printf %q "$tmp")
# NOTE assume sudo has cleared the env
exec /usr/bin/runuser -s /bin/bash --session-command="SHELL=$shell && $shell -l -c $cmd; ret=\$?; rm -rf $tmp; exit \"\$ret\"" "$user"
