# Stream over SSH

## VLC
Open `sudo nano /etc/ssh/sshd_config `

Add at the end of the config file:
```
KexAlgorithms +diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256
HostKeyAlgorithms ssh-rsa
```

Restart

## VLC + SSH Android
```
KexAlgorithms +diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256
HostKeyAlgorithms ssh-ed25519,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,rsa-sha2-512,rsa-sha2-256,ssh-rsa
```
Restart
