# Install Puppet Enterprise

- Refer:
  - https://puppet.com/try-puppet/puppet-enterprise/download/

## Download
```
wget --content-disposition 'https://pm.puppet.com/cgi-bin/download.cgi?dist=ubuntu&rel=18.04&arch=amd64&ver=latest'
tar -xf puppet-enterprise-2021.6.0-ubuntu-18.04-amd64.tar.gz
cd puppet-enterprise-2021.6.0-ubuntu-18.04-amd64/
```

## Note: Please make sure to
  - Disable firewall on the puppet master
  - Run puppet agent -t

## Configure Puppet before installation
```
vi conf.d/pe.conf
```

## Install
```
sudo ./puppet-enterprise-installer
sudo su -
source /etc/profile.d/puppet-agent.sh
```

## Set password
```
puppet infrastructure console_password --password=admin123
```

## Configure
```
puppet -V
sudo nano /etc/puppetlabs/puppet/puppet.conf
```

## Check logs
```
tail -f /var/log/syslog   # Ubuntu
tail -f /var/log/messages   # Centos
```

## Restart Services
```
service pe-puppetserver restart
service pe-puppetserver status
```

## Configuration parameters and the pe.conf file

## Log in to the PE console
- Credentials: admin/admin123
- Open the console by entering the URL <PRIMARY_HOSTNAME> into your browser. The hostname is your primary server's trusted certificate name.
- On the console login page, log in with the username admin and the password you created when installing. Keep track of this login because you'll need it later.
