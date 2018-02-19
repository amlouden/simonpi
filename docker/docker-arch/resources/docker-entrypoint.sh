#!/bin/bash

echo "===> Update&install all needed packages"

pacman -Suy --noconfirm --noprogressbar binutils \
		fakeroot dnsmasq dosfstools \
		iproute2 qemu-headless-arch-extra \
		sudo wget libseccomp

echo "===> enable sudo from nobody with nopasword, for 'sudo -u nobody makepkg -i' to work"
echo "nobody ALL=(ALL:ALL) NOPASSWD: ALL" | (VISUAL="tee -a" EDITOR="tee -a" visudo)

echo "===> FIX stupid bug when sudo inside docker"
#http://bit-traveler.blogspot.com/2015/11/sudo-error-within-docker-container-arch.html
sed -e "/nice/s/\*/#*/" -i /etc/security/limits.conf

echo "===> Networking settings ..."
    mkdir -p /dev/net
    mknod /dev/net/tun c 10 200

## install_from_aur
install_from_aur() {
	local name=$1
	cd /home
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/$name.tar.gz
	tar xvf $name.tar.gz
	chown nobody:nobody -R $name
	cd $name
	sudo -Eu nobody makepkg --noconfirm --nosign -si
	cd ..
	rm -rf $name
}

echo "===> install simonpi"
install_from_aur simonpi-git

echo "===> cleanup"
yes Y | pacman -Rscn git
yes Y | pacman -Scc

echo "===> DONE $0 $*"

