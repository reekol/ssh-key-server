#!/bin/bash
# The user is stored in $1
curl -m 3 -sf https://github.com/$1.keys
# OR
# ssh my-secret-server "cat /home/$1/.ssh/*.pub"
