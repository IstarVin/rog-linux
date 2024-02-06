pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

wget "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8b15a6b0e9a3fa35" -O g14.sec
pacman-key -a g14.sec

echo "
[g14]
Server = https://arch.asus-linux.org" >> /etc/pacman.conf

pacman -Suy

pacman -S asusctl
systemctl enable --now power-profiles-daemon.service

pacman -S supergfxctl
systemctl enable --now supergfxd

pacman -S rog-control-center

pacman -Sy linux-g14 linux-g14-headers

grub-mkconfig -o /boot/grub/grub.cfg
