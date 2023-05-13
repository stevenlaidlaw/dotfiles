#!/bin/bash
defaults write org.eyebeam.SelfControl BlockDuration -int 480
defaults write org.eyebeam.SelfControl HostBlacklist -array reddit.com netflix.com twitch.tv chess.com lichess.org primevideo.com tiktok.com instagram.com facebook.com gumtree.com.au storedj.com.au
defaults read org.eyebeam.SelfControl
sudo /Applications/SelfControl.app/Contents/MacOS/org.eyebeam.SelfControl $(id -u $(whoami)) --install

# To install
# `sudo cp selfcontrol.sh /usr/local/bin/selfcontrol.sh`
# `sudo crontab -e`
# # Run every Mon, Tue, Thu from 8am
# 0 8 * * 1,2,4 /usr/local/bin/selfcontrol.sh
# # Run every Wed, Fri from 6am
# 0 6 * * 3,5 /usr/local/bin/selfcontrol.sh
