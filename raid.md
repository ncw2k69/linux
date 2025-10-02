# raid
sudo apt install mdadm

# raid 0 setup
sudo mdadm --create /dev/md0  --chunk=512K  --level=0  --raid-devices=2 /dev/sdb /dev/sdc

# add raid to config file
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf

# make it stick after restart
go into disk or fstab and mount the partitions

# update system
sudo update-initramfs -u
