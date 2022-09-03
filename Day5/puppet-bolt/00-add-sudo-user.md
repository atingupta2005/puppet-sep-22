# Add Sudo user on CentOS
```
sudo su -
useradd boltuser
passwd boltuser
usermod -aG wheel boltuser
exit
su - boltuser
sudo yum update
```
