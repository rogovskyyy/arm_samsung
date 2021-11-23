#/bin/bash

sudo apt update
sudo apt install cups
sudo usermod -a -G lpadmin pi
sudo reboot
cupsctl --remote-admin --remote-any --share-printers
sudo apt-get install git build-essential libcups2-dev
git clone https://gitlab.com/ScumCoder/splix.git
git clone https://github.com/nu774/jbigkit.git
cd jbigkit && cp Makefile.original Makefile && make
cd libjbig && cp libjbig85.a /usr/lib && cd ../..
cd splix/splix && make && sudo make install
echo 'Installation is done. Now copy your printer drivers to /usr/share/cups/model/ \n'
echo 'e.g. sudo cp ppd/m2020.ppd /usr/share/cups/model/'
echo 'Credits to dufzss @ forums.raspberrypi.com'
