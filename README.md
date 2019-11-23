# ssh-key-server
### Generate keys using.
```bash
ssh-keygen -t rsa
```
### Copy contents of ~./.ssh/id_rsa.pub to publicly accessible location
- Or use GitHub as keyserver on https://github.com/${username}.keys

### Create file /usr/local/bin/userkey.sh and chmod a+x
```bash
#!/bin/bash
curl -sf https://github.com/$1.keys
```

### Configure sshd
- add those lines to /etc/ssh/ssd_config
```
AuthorizedKeysCommand      /usr/local/bin/userkeys.sh
AuthorizedKeysCommandUser  nobody
```

### Voila, you are using github as a keyserver.
