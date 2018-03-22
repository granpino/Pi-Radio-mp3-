# Pi-Radio-mp3-
Raspberry pi internet radio and mp3 player

This internet radio and mp3 player uses a 3.5 HDMI LCD touch screen for operation. The original project was published by Adafruit. https://learn.adafruit.com/raspberry-pi-radio-player-with-touchscreen/overview The project uses MPC , MPD and Pygame.

Installation:

    Download the raspbian stretch image and burn to a 8GB or bigger SD card. To start you should be know how to SSH to the raspberry pi. You can also connect a mouse and keyboard to the pi and install everything locally. See https://www.raspberrypi.org/documentation/

    Attach the LCDscreen to the raspberry pi. 

    Open the terminal screen and type

sudo raspi-config

    set internationalisation options and change Timezone 

    Go to Advanced Options and enable VNC, SSH and set the resolution to 640x480

    Exit and reboot.

    The stretch image takes a lot of space on the SD card and we need to make room for the MP3 music. SSH to the Pi and delete Wolfram and Libreoffice, or use the mouse on the Pi and select add/remove.

sudo apt-get purge wolfram-engine libreoffice* -y

sudo apt-get clean

sudo apt-get autoremove

sudo apt-get update

sudo apt-get upgrade

    After the upgrade you are ready for the installation. Now install the LCD drivers.

git clone https://github.com/goodtft/LCD-show.git

chmod -R 755 LCD-show

cd LCD-show

sudo ./MPI3508_600_400-show

    The resolution used with the pi-radio is 640x480, therefore you need change the config.txt.

sudo nano /boot/config.txt

    and change the resolution at the bottom of the file to 640x480. Save, exit and reboot.

sudo reboot

    At this point the Pi should boot to the stretch desktop and the touchscreen working. Now install the Pi-radio files.

cd

git clone https://github.com/granpino/Pi-Radio-mp3-.git

chmod -R 755 Pi-Radio-mp3-

cd Pi-Radio-mp3-

sudo ./install.sh

    The installation file will create the required playlists for mp3 and internet radio. There should be an icon on the raspberry desktop. To open the Pi-radio double tap on the radio shortcut. To change the desktop for a single click go to file manager, click on Edit and at the very bottom select preferences. Select 'open files with single click'.

    The application uses pygame and the touchscreen will only run under lx-terminal. I you run the application from SSH, the touchscreen will work upside down. I elected to run the app from the desktop because I want to run other apps on the same Pi that use the LCD screen. I did not have to calibrate the screen to make it work. I included some sample mp3 files and radio stations for your testing. To add other radio stations to the playlist go to http://www.radiosure.com/stations/ and copy the m3u links. 

mpc add <link of station>

mpc save playlist

    or edit the file 

sudo nano ~/var/lib/mpd/playlists/playlist

    To add other mp3 files, transfer these to the mp3 folder and type 

sudo ls -1 /home/pi/Music/*.mp3 > /var/lib/mpd/playlists/mp3.m3u

This project was a lot of fun to put together and I learned a lot about python. There is a lot of room for improvement. In the future I would like to add Pandora.

