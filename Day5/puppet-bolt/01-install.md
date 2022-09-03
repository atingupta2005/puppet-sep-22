# Puppet Bolt
- Bolt can be installed on your local workstation and connects directly to remote targets with SSH or WinRM, so you are not required to install any agent software.

## Installing Bolt on CentOS / RHEL
- Refer: https://puppet.com/docs/bolt/latest/bolt_installing.html
```
sudo rpm -Uvh https://yum.puppet.com/puppet-tools-release-el-6.noarch.rpm
sudo yum install puppet-bolt -y
```


## Installing Bolt on Ubuntu
```
sudo apt-get update
wget https://apt.puppet.com/puppet-tools-release-bionic.deb
sudo dpkg -i puppet-tools-release-bionic.deb
sudo apt-get update
sudo apt-get install puppet-bolt
```
