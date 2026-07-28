# Enable TearFree in Xorg (X11)
Fix screen tearing on Linux with Intel graphics by enabling TearFree mode in Xorg, switching to a Wayland session, or using a window compositor. 

Create or edit the configuration file /etc/X11/xorg.conf.d/20-intel.conf with root permissions:
```
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "TearFree" "true"
EndSection
```
