# PDK
```
wget https://apt.puppet.com/puppet-tools-release-bionic.deb
sudo dpkg -i puppet-tools-release-bionic.deb
sudo apt-get update
sudo apt-get install pdk
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
cd my_module
```

## Generate a class
### From the command line, in your module's directory, run:
```
pdk new class class_name
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
