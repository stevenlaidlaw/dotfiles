#!/bin/sh

if [ -z "$1" ]; then
		echo "Usage: $0 <codespace>"
		echo "`codespace` finds the first available codespace that matches the given pattern"
		exit 1
fi

codespace=`gh cs list | grep "$1" | head -n 1 | awk '{print $1}'`

if [ -z "$codespace" ]; then
		echo "No codespace found"
		exit 1
fi

echo "Forwarding port 80"
gh cs ports forward 80:80 -c "$codespace" &
pid=$!

echo "Attempting to connect to codespace $codespace"
gh cs ssh -c "$codespace"

kill -s TERM "$pid"
echo "Killed codespace port forwarding ($pid)"
