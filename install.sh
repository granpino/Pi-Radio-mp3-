#!/bin/bash
#
#pi-radio installation
#create playlists
 sudo touch ~/var/lib/mpd/playlists/playlist
 sudo touch ~/var/lib/mpd/playlists/mp3

 sudo mkdir ~/ mp3
 sudo mv *.mp3 ~/ mp3
 sudo ls -1 /home/pi/mp3/*.mp3 > /var/lib/mpd/playlists/mp3.m3u

#build internet radio playlist

  cat <<EOF > /var/lib/mpd/playlists/playlist.m3u

http://staff.timb-radio.com:8000/trance_192
http://relay3.slayradio.org:8000/
http://c10icy.prod.playlists.ihrhls.com/4846_icy

 EOF


# create shortcut on destop
 sudo touch ~/Desktop/Radio.desktop
 sudo cat <<EOF > ~/Desktop/Radio.desktop

#!/usr/bin/bash

[Desktop Entry]
Name=Radio
Type=Application
Exec=lxterminal -t "Radio" --working-directory=/home/pi/pi-radio/ -e ./radio.sh
Icon=/home/pi/pi-radio/icon.png
Comment=test
Terminal=true

 EOF




