# ROCm support for AMD Ryzen AI 9 HX 370 w/ Radeon 890M gfx1150
This is a quick guide how to enable ROCm on GFX1150 from AMD Ryzen AI 9 HX 370 APUs
Tested on:
- Debian 13 (Linux 6.12.57): OK
- Ubuntu Mate 24 (Linux 6.xx.xx): TBU

## Linux
From AMD guide [here](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/reference/user-kernel-space-compat-matrix.html) check it for the latest version
- Install kernel headers and development packages
```
sudo apt install python3-setuptools python3-wheel
```
- Enter the following commands to install the installer script (check repo for your distribution package, this one works also for Debian)
```
sudo apt update
wget https://repo.radeon.com/amdgpu-install/7.1.1/ubuntu/noble/amdgpu-install_7.1.1.70101-1_all.deb
sudo apt install ./amdgpu-install_7.1.1.70101-1_all.deb
```
- Install the Graphics driver and ROCm layer
```
sudo amdgpu-install -y --usecase=rocm,graphics --no-dkms
```
- Reboot the system
```
sudo reboot
```

### Set Groups permissions
After the reboot, do the following:

- Add user to the render and video group using the command
```
sudo usermod -a -G render,video $LOGNAME
```
- Reboot the system
```
sudo reboot
```

### Post-install verification checks
After the reboot, do the following:
- Check if the GPU is listed as an agent
```
rocminfo
```
- Expected result
```
ROCk module version x.xx.xx is loaded
[...]
*******                  
Agent 2                  
*******                  
  Name:                    gfx1150                            
  Uuid:                    GPU-XX                             
  Marketing Name:          AMD Radeon Graphics                
  Vendor Name:             AMD
  [...]
[...]
```
## Bonus - AMD Monitor
Use https://github.com/Umio-Yasuno/amdgpu_top 

Install dependencies
```
sudo apt install libdrm-dev
```
Go to release page and download the latest version from there https://github.com/Umio-Yasuno/amdgpu_top/releases
- x64: https://github.com/Umio-Yasuno/amdgpu_top/releases/download/v0.11.0/amdgpu-top_0.11.0-1_amd64.deb
- arm64: https://github.com/Umio-Yasuno/amdgpu_top/releases/download/v0.11.0/amdgpu-top_0.11.0-1_arm64.deb

## Python
Check for the latest version of ROCm `rocm7.x` at https://download.pytorch.org/whl/nightly/

Click on it (ex: `rocm7.1`) copy the link from address bar
```
https://download.pytorch.org/whl/nightly/rocm7.1/
```

### Setting ENV
- Create a new folder for the python project
- Inside the project folder, create python env: `python3 -m venv ./venv`
- Activate env: `source venv/bin/activate`
- Install ROCm packages (copied link from the top): `pip install --pre torch torchvision torchaudio --index-url LINK-HERE-ROCM-X.X`
```
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm7.1
```
### Check that ROCm is activated
Run:
```
python3 -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}'); print(f'Device: {torch.cuda.get_device_name(0) if torch.cuda.is_available() else "None"}')"
```
The output should look like this if ROCm is working (recognized as CUDA, is a plus, python code needs no change)
```
CUDA available: True
Device: AMD Radeon 890M
```

### Install Project Requirements 
Now you can install the other packages that you need for your project
- Command line: `pip install packA packB ...`
- requirements file: `pip install -r requirements.txt`

