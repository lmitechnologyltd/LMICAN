# LMICAN
#Open the Raspberry Pi terminal and run the following command
wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.71.tar.gz
tar zxvf bcm2835-1.71.tar.gz
cd bcm2835-1.71/
sudo ./configure && sudo make && sudo make check && sudo make install
# For more, you can refer to the official website at: http://www.airspayce.com/mikem/bcm2835/
#Open the Raspberry Pi terminal and run the following command
cd
sudo apt-get install wiringpi
#For Raspberry Pi systems after May 2019 (earlier than that can be executed without), an upgrade may be required:
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
gpio -v
# Run gpio -v and version 2.52 will appear, if it doesn't it means there was an installation error

# Bullseye branch system using the following command:
git clone https://github.com/WiringPi/WiringPi
cd WiringPi
. /build
gpio -v
# Run gpio -v and version 2.70 will appear, if it doesn't it means there was an installation error
sudo apt-get update
sudo apt-get install python-serial
sudo pip install python-can
sudo apt-get install p7zip-full
wget https://files.waveshare.com/upload/2/2f/RPi_Zero_Relay_Code.7z
7z x RPi_Zero_Relay_Code.7z  -r -o./RPi_Zero_Relay_Code
sudo chmod 777 -R RPi_Zero_Relay_Code/

printf '%s\n' 'dtparam=spi=on' 'dtoverlay=mcp2515-can0,oscillator=16000000,interrupt=25,spimaxfrequency=3000000' 'third line' >> /boot/config.txt
sudo reboot
echo "dmesg | grep -i '\(can\|spi\)'"
dmesg | grep -i '\(can\|spi\)'
cd ~/RPi_Zero_Relay_Code/CAN/wiringPi/receive/
make clean
make
sudo ./can_receive
