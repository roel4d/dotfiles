# Install new Ubuntu VPS

## First steps as root

```
apt update  
apt upgrade  
apt install stow ripgrep fzf mc build-essential  

ufw allow ssh   
ufw allow http
ufw allow https
ufw enable  

adduser roel4d
usermod -aG sudo roel4d 
rsync -a --chown=roel4d:roel4d /root/.ssh/ /home/roel4d/.ssh/
```

