#!/bin/bash
nohup mopidy &
if [ -p /tmp/mpd.fifo ]; then
	while :; do yes $’\n’ | nc -lu 127.0.0.1 5555 > /tmp/mpd.fifo; done &
else
	mkfifo /tmp/mpd.fifo;while :; do yes $’\n’ | nc -lu 127.0.0.1 5555 > /tmp/mpd.fifo; done &
fi
