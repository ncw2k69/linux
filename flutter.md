# Flutter
Installing compiler for linux Desktop App 
In case the following command fails with a missing http file
```
$ sudo apt install libgtk-3-dev
...
Err:1 http://deb.debian.org/debian trixie/main amd64 libglib2.0-dev amd64 2.84.4-3~deb13u1
  404  Not Found [IP: 146.75.122.132 80]
Error: Failed to fetch http://deb.debian.org/debian/pool/main/g/glib2.0/libglib2.0-dev_2.84.4-3%7edeb13u1_amd64.deb  404  Not Found [IP: 146.75.122.132 80]
Error: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
```
Do before
```
sudo apt install libglib2.0-dev
```
Then
```
$ sudo apt install libgtk-3-dev
```
