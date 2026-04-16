# Leif
Web Explorer

## Raspberry Pi OS Lite (64-bit)
A port of Debian Trixie with no desktop environment - [Raspberry Pi OS](https://www.raspberrypi.com/software/operating-systems/)
| Specs | Details |
| ------| ------- |
| Release date | 13 Apr 2026 |
| System | 64-bit |
| Kernel version | 6.12 |
| Debian version | 13 (trixie) |
| Download size | 537 MB |
| Storage required | 3,072 MB |

## Services to disable
### cloud
```bash
sudo systemctl stop cloud-init-main.service 
sudo systemctl disable cloud-init-main.service

sudo systemctl stop cloud-init-network.service 
sudo systemctl disable cloud-init-network.service

sudo systemctl stop cloud-init-local.service
sudo systemctl disable cloud-init-local.service

sudo systemctl stop cloud-init-hotplugd.service 
sudo systemctl disable cloud-init-hotplugd.service

sudo systemctl stop cloud-config.service 
sudo systemctl disable cloud-config.service

sudo systemctl stop cloud-final.service 
sudo systemctl disable cloud-final.service
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

## BUN Install
```bash
curl -fsSL https://bun.sh/install | bash
```
