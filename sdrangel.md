# Install SDRAngel - Ubuntu Mate 24.xx LTS

### Install Dependecies
HackRF One Driver
```
sudo apt install hackrf
```
Install `libuhd 4.9.0`
```
sudo add-apt-repository ppa:ettusresearch/uhd
sudo apt update
sudo apt install libuhd-dev uhd-host
```
Alternative (optional)
Download `libuhd 4.9.0` and install from experimental repositories:
- https://packages.debian.org/sid/amd64/libuhd4.9.0/download
- http://ftp.ubuntu.com/ubuntu/ubuntu/pool/universe/u/uhd/

### Get the latest version of SDRAngel from official git (.deb) file
Download the [sdrangel_7.23.2_ubuntu-24.04_amd64.deb](https://github.com/f4exb/sdrangel/releases/download/v7.23.2/sdrangel_7.23.2_ubuntu-24.04_amd64.deb), all other [Releases](https://github.com/f4exb/sdrangel/releases/)

### Install SDRAngel
- Double Click on `sdrangel_7.23.2_ubuntu-24.04_amd64.deb` and select `gdebi` or any other tool
- Check if pointing out `missing dependecies` in red
- Click `Install`
