# ssh-key-server
### Generate keys using.
```bash
ssh-keygen -t rsa
```
- Copy contents of ~./.ssh/id_rsa.pub to publicly accessible location
- Or use GitHub as keyserver on https://github.com/${username}.keys

### Create file /usr/local/bin/userkeys.sh and chmod a+x
```bash
#!/bin/bash
# The user is stored in $1
curl -sf https://github.com/$1.keys
```
- Or use ssh to your own key server
```bash
#!/bin/bash
ssh my-secret-server "cat /home/$1/.ssh/*.pub"
```

### Configure sshd
- add those lines to /etc/ssh/ssd_config
```
ChallengeResponseAuthentication no
UsePAM no
PasswordAuthentication no
AuthorizedKeysCommand      /usr/local/bin/userkeys.sh
AuthorizedKeysCommandUser  nobody
```

### Voila, you are using github as a keyserver.
