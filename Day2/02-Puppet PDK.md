# PDK
## On Ubuntu
```
wget https://apt.puppet.com/puppet-tools-release-bionic.deb
sudo dpkg -i puppet-tools-release-bionic.deb
sudo apt-get update
sudo apt-get install pdk
```

# On CentOS
```
rpm -qa | grep pdk
rpm -e pdk-2.5.0.0-1.el8.x86_64
rpm -qa | grep puppet-tools
rpm -e puppet-tools-release-1.0.0-6.el8.noarch
wget --content-disposition 'https://pm.puppet.com/cgi-bin/pdk_download.cgi?dist=el&rel=7&arch=x86_64&ver=latest'
rpm -ivh ./pdk-2.5.0.0-1.el7.x86_64.rpm
```

## Basic usage
- PDK can generate modules and classes, validate module metadata, style, and syntax, and run unit tests.

```
alias cdpp="cd /etc/puppetlabs/code/environments/production/manifests"
```

```
cdpp
```

## Generate a module
```
pdk new module my_module
tree my_module
cd my_module
```

## Generate a class
### From the command line, in your module's directory, run:
```
pdk new class class_name
tree .
```

## Validating a module
### In the module's directory, run:
```
pdk validate
```

## Run unit tests
```
pdk test unit
```
