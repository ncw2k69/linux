## APT

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

## Keyboard - Open File explorer (Win+E)

`Settings` > `Keyboard` > `Keyboard Shortcuts - View and Customize` > `Launchers`

`Home Folder` > `Super` + `E` > `Save`

## Install

```bash
sudo apt install gnome-shell-extension-manager gnome-weather
```

## Extensions

`Apps` > `Extensions`

### Disable (Installed Tab)
- Desktop Icons NG
- Snapd Search Provider
- Ubuntu Dock
- Ubuntu Tiling Assistant
- Web Search Provider

### Install (Browse Tab)
- Tasks in Panel
- Tiling Shell
- Weather O'clock
