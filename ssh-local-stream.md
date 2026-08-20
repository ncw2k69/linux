# Stream over SSH

Open `/etc/ssh/sshd_config `

Add at the end of the config file:
```
KexAlgorithms +diffie-hellman-group-exchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group14-sha256
HostKeyAlgorithms ssh-rsa
```

Restart
