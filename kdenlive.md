# Kdenlive not starting up

## Snap - Installed from Ubuntu App Center (26.04...)
In case it worked and you disabled "Show at startup" the welcome screen, the app will fail to start the second time.
It loads into memory, then it fails.

### Fix
Open:
```
/home/[user]/snap/kdenlive/[current or 144 (latest)]/.config/kdenlive-snaprc
```
Change back `showWelcome` from `false` to `true`
```
[startup]
...
showWelcome=true <-- THIS
...
```
