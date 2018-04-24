#!/bin/bash
#
#pi-radio installation
#create playlists
 sudo touch /var/lib/mpd/playlists/playlist.m3u
 sudo touch /var/lib/mpd/playlists/mp3.m3u

 sudo mv *.mp3 /home/pi/Music/
 sudo ls -1 /home/pi/Music/*.mp3 > /var/lib/mpd/playlists/mp3.m3u

#build sample internet radio playlist

 cat <<EOF > /var/lib/mpd/playlists/playlist.m3u

http://staff.timb-radio.com:8000/trance_192
http://relay3.slayradio.org:8000/
http://c10icy.prod.playlists.ihrhls.com/4846_icy

EOF


# create shortcut on desktop
 
 touch Piradio.desktop
 cat <<EOF > Piradio.desktop

#!/usr/bin/bash

[Desktop Entry]
Name=Radio
Type=Application
Exec=lxterminal -t "Radio" --working-directory=/home/pi/Pi-Radio-mp3-/ -e ./radio.sh
Icon=/home/pi/Pi-Radio-mp3-/icon.png
Comment=test
Terminal=true

EOF

sudo chmod 755 Piradio.desktop
sudo mv Piradio.desktop /home/pi/Desktop

#add virtual USB drive if used
sudo mkdir /mnt/usbdrive
