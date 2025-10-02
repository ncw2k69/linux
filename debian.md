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
