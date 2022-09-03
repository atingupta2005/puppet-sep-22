# Adhoc Commands
## Bootstrap client: Tasks that bootstrap or install Puppet on the agent node
```
puppet agent -t --server <puppet master>
puppet agent -t --server puppet
```

## Write a manifest
```
sudo touch /etc/puppetlabs/code/environments/production/manifests/sample.pp
```

## Open client machine and check if we can access this file from there
 - # Test the connection
```
sudo /opt/puppetlabs/bin/puppet agent -t
```

## Open master server and put some content in the sample file
```
sudo vim /etc/puppetlabs/code/environments/production/manifests/sample.pp
```

```
node '<node-host-name>'	{
 package { 'git':
        ensure=> intalled,
 }
}

node 'default'	{
	$packages = ['telnet', 'tree', 'git', 'zsh']
	package { $packages:
	ensure => "installed"
  }
}
```

## Open Client Machine and test
```
sudo /opt/puppetlabs/bin/puppet agent --test
```

## Verify the services
```
git
tree
```


## Displaying facts:
```
facter              # All system facts
facter -p           # All system and Puppet facts
facter -y           # YAML
facter -j           # JSON
facter <name>  # A specific fact
facter timezone
```

## Managing certificates:
```
puppetserver ca list
puppetserver ca list --all
puppetserver ca sign <name>
puppetserver ca clean <name> #Removes cert
```

## Managing nodes:
```
puppet node clean <name> #Removes node + cert
```

## Managing modules:
```
puppet module list
puppet module install <name>
puppet module uninstall <name>
puppet module upgrade <name>
```

## Inspecting resources and types:
```
puppet describe -l
puppet resource <type name>
puppet resource service
```

## To check the version
```
puppet --version
```

## To remove packages
```
package { 'apache2.0-common':
	ensure => absent,
}
```

## To update packages
```
package { 'puppet':
	ensure => latest,
}
```

## To start service at the boot time
```
service { 'nginx':
		ensure => running,
		enable => true, #false disables auto-startup
}
```

## To set to a specific version
```
package { 'nginx':
	ensure => '1.1.18-1ubuntu0.1',
}
```

## Install Apache
```
puppet module list
puppet module install puppetlabs/mysql
puppet apply -e "include mysql::server"
telnet localhost 3306
puppet apply -e "include mysql::server"
```

## TimeSync
 - Ideally, we have accurate time on the server and agents. We can test Puppet from the command line to ensure Chronyd is installed and running
```
puppet apply -e 'package { "chrony": ensure => installed }'
puppet apply -e 'service { "chronyd": ensure => running , enable => true }'
```

## Idempotent
 - Puppet, being Idempotent, allows the command to run many times and only actions if we do not meet the configuration requirement
```
puppet apply -e 'service { "chronyd": ensure => running , enable => true }'
systemctl stop chronyd
puppet apply -e 'service { "chronyd": ensure => running , enable => true }'
```

# Remove
```
puppet apply -e 'package { "chrony": ensure => absent }'
```
