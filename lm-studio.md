# AppImages - Ubuntu - LM Studio Fix
Error
```
The SUID sandbox helper binary was found, but is not configured correctly. Rather than run without sandboxing I'm aborting now.
```

[LM Studio](https://lmstudio.ai/)


For deactivate restrictions
```bash
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
```
For activate restrictions
```bash
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=1
```
FUSE
```bash
sudo apt install libfuse2t64
```
