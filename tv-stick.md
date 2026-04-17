## Sudo
Install `sudo` as  root
```
apt install sudo
```
Add user in list
```
nano /etc/sudoers.d/me
```
Content
```
your-user-name-here     ALL=(ALL)       ALL
```
## APT
Open
```
sudo nano /etc/apt/apt.conf
```
Add
```
APT::Install-Recommends "false";
APT::Install-Suggests "false";
```
## Install Apps
```
sudo apt install htop btop iotop ncdu mc cbm net-tools ethtool curl ssh sshfs lm-sensors lshw avahi-daemon
```

## Install Media KODI
```
sudo apt install cec-utils libcec kodi-inputstream-adaptive kodi kodi-repository-kodi kodi-pvr-hts kodi-pvr-iptvsimple nginx
```

## Start KODI on Boot
### Create the Systemd Service
Create a service file that waits for the network to be fully up.
```bash
sudo nano /etc/systemd/system/kodi.service
```
Add the following content:
```ini
[Unit]
Description=Kodi Standalone
After=systemd-user-sessions.service network.target network-online.target
Wants=network-online.target

[Service]
User=root
Group=root
Type=simple
# Wait for network to be truly online
ExecStartPre=/bin/sh -c 'until ping -c1 google.com; do sleep 1; done'
ExecStart=/usr/bin/kodi-standalone
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
```
### Enable the Service
```bash
sudo systemctl daemon-reload
sudo systemctl enable kodi.service
```


## Fixing HALT on Power Off or Reboot
There is an issue related to the HSUART DMA support in the kernel that will hang on reboot or shutdown. 
Open `blacklist.conf`
```
sudo nano /etc/modprobe.d/blacklist.conf
```
Add these lines
```
blacklist dw_dmac_core
install dw_dmac /bin/true
install dw_dmac_core /bin/true
```
Then, update `initramfs`
```
sudo update-initramfs -u
```
_Source_: [Debian Wiki - Installing Debian On Dell Wyse 3040](https://wiki.debian.org/InstallingDebianOn/Dell/Wyse%203040#System_Summary)

## Disk Check
Only for test env, we don't care about data, interested in fast startups

Open `fstab`
```
sudo nano /etc/fstab
```
Change column `pass` value from `1` to `0`, skips disk checks
```
# <file system>                    <mount point>   <type>  <options>          <dump>  <pass>
UUID=xxxx-xxxx-xxxx-xxxx-xxxxxxx   /               ext4    errors=remount-ro  0       1
to
UUID=xxxx-xxxx-xxxx-xxxx-xxxxxxx   /               ext4    errors=remount-ro  0       0
```


## GRUB Timeout
Open the `grub` file:
```
sudo nano /etc/default/grub
```
Change `GRUB_TIMEOUT` to what you want `0` or `1`... as high or low as you want
```
GRUB_TIMEOUT=5
to
GRUB_TIMEOUT=1
```
Update grub
```
sudo update-grub
```

## HTOP CPU Freq & Temp
Open htop config file
```
nano ~/.config/htop/htoprc
```
Update `show_cpu_frequency` and `show_cpu_temperature` to `1`
```
...
show_cpu_frequency=1
show_cpu_temperature=1
...
```
Optional - Copy same config to ROOT/SUDO 
```
sudo cp -r ~/.config/htop/ /root/.config/
```
## Reboot
```bash
sudo reboot
```
