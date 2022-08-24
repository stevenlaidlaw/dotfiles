#!/bin/sh

codespace="$CS_NAME"

gh cs ports forward 80:80 -c "$codespace" &
pid=$!

gh cs ssh -c "$codespace"

kill -s TERM "$pid"
echo "Done"
