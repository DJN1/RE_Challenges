#!/bin/bash

apt install apt-transport-https -y
echo "deb https://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list
apt update
dpkg --add-architecture i386
apt update && apt upgrade -y
apt install pkg-config libssl-dev bc libreoffice -y

mkdir ~/RE_Challenges/Help/C/Source-Code

cd ~/RE_Challenges/Challenges/C

make all

mv *.c ~/RE_Challenges/Help/C/Source-Code
mv makefile ~/RE_Challenges/Help/C/Source-Code

git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

git clone https://github.com/hq6/GdbShellPipe ~/GdbShellPipe
~/GdbShellPipe/Install.sh

echo "set print asm-demangle on" >> ~/.gdbinit
echo "set disassembly-flavor intel" >> ~/.gdbinit

git clone https://github.com/radare/radare2 ~/radare2
~/radare2/sys/install.sh

r2pm init
r2pm -i r2dec

wget -O ~/ghidra.zip https://ghidra-sre.org/ghidra_9.0.4_PUBLIC_20190516.zip
unzip ~/ghidra.zip -d ~/
rm ~/ghidra.zip

wget -O ~/cutter https://github.com/radareorg/cutter/releases/download/v1.8.3/Cutter-v1.8.3-x64.Linux.AppImage
chmod +x ~/cutter
mv ~/cutter /bin

cd ~/RE_Challenges
