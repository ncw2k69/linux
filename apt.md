# APT
Disable Recommenation and Suggenstions
https://askubuntu.com/a/179089

### Modify and add
Open
```
sudo nano /etc/apt/apt.conf
```
Add
```
APT::Install-Recommends "false";
APT::Install-Suggests "false";
```

