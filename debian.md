# Enable Backports and Install Kernel 7.x
Check your current kernel version by running:
```
uname -r
```
Add the Debian 13 backports source file using the terminal:
```
echo "deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list.d/trixie-backports.list
```
Refresh your system package index:
```
sudo apt update
```
Install the 7.x Linux kernel package from backports:
```
sudo apt install -t trixie-backports linux-image-amd64
```
Reboot your computer to load the new 7.x kernel:
```
sudo reboot
```

# fix app not found in path - reboot
edit `/root/.bashrc` and add
```
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```
# add user to sudo list
- switch to root with `su`
- edit `nano /etc/sudoers`
- add after `%sudo   ALL=(ALL:ALL) ALL`
```
your-user-name-here     ALL=(ALL)       ALL
```
- reboot

# add me
```
nano /etc/sudoers.d/me
```
content
```
your-user-name-here     ALL=(ALL)       ALL
```
### test 
- exit root
```
exit
```
- update
```
sudo apt update
```
