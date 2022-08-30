## Configuration
 - Using the puppet config command we can view and set configuration parameters including the path to the manifest
 - If the manifest is a directory then each manifest is processed in alphanumeric order
# Print settings from Puppet.confg file as well as the defaults
puppet config print
puppet config print config
puppet config print manifest

#To specify which section from config file to print and also which environment
puppet config print manifest --section master --environment production

## Manifest Files
 - The puppet agent can apply local manifests by specifying the path
 - If the path is a directory all manifests are processed
 - If the agent connects to the server the agent the manifests are located by the settings of the server

#site.pp is the default/main file
vim /etc/puppetlabs/code/environments/production/manifests/sample.pp
notify {'Hello World':
	message => "Hello World!",
}

#To apply locally by specifying the path to manifest file
puppet apply /etc/puppetlabs/code/environments/production/manifests/sample.pp

#To get from the puppet server
puppet agent -t

## Agent Run
 - Be default the agent runs every 30 minutes. We can force a run from the CLI.
```
puppet config print runinterval
expr 1800 / 60
puppet agent -t
```
#Notice: Hello World!

## Working with Default Environments
```
alias cdpp="cd $(puppet config print manifest)"
cdpp
vim 01.pp
notify {'Hello World':
	message => "Hello World!",
}
```

```
puppet apply 01.pp
puppet agent -t
```
```
vim 02.pp
notify {'Hello World 2':
	message => "Hello World 2!",
}
```
```
puppet agent -t
puppet config print runinterval
expr 1800 / 60
systemctl status puppet
```
## BASH Aliases
 - We may often move to the manifest directory
 - We can create an alias to make this easier
alias cdpp="cd $(puppet config print manifest)"
alias
vim ~/.bashrc #add the line to bottom of file
alias cdpp="cd /etc/puppetlabs/code/environments/production/manifests"
unalias cdpp
source ~/.bashrc
alias ; cdpp; pwd

# Resources
 - Resources are the main building block of Puppet:
	- notify resource with Hello World
	- package resource to ensure chrony was installed
	- service resource to ensure chronyd was running
 - Puppet is declarative, meaning it states what it want done not how to do it
 - On CentOS the packaging will be done with dnf/yum, on Ubuntu with apt and Windows with chocolatly.

## List Resources and Help
 - The first command list all resource types. We can gain help on a type with describe and we can print the example configuration from a resource.

puppet resource --type
puppet describe service

#service should show as running and enabled
puppet resource service atd

#If at is not installed on my system so should show as stopped and disabled

# Extending Manifests Into Modules
 - We started off with a quick look at installing the Apache Web Server with a downloaded module. We now look more at modules and creating our own

## Modules
 - Modules are great ways to encapsulate code in to reusable lumps. Puppet forge is a great resource for modules that have been shared. The stdlib from puppetlabs is always useful
puppet module list
puppet module install puppetlabs/stdlib
puppet module uninstall puppetlabs/stdlib --force
#To install modules in a shared environment so that it can be used in any environment
#Installing in a shared module directory makes it available across environments
puppet module install -i /etc/puppetlabs/code/modules puppetlabs/stdlib

#Examples
cat /etc/puppetlabs/code/modules/stdlib/examples/file_line.pp

## Example Manifest From Module
 - A puppet manifest will have the extension .pp and contains code to be run on agents. We can use puppet apply to execute local manifests
cp /etc/puppetlabs/code/modules/stdlib/examples/file_line.pp ~/
puppet apply ~/file_line.pp
cat /tmp/dansfile

## File Edits Using file_line Resource
 - Rather than deliver a complete file we can edit the file with file_line. The file_line resource that ships with the puppetlabs/stdlib module and shares the same top level namespace. We can easily replace or add lines

#Example Module (Require tag):
service { 'sshd':
	ensure => 'running',
	enable => true,
}
file_line { 'root_login_ssh':
	path => '/etc/ssh/sshd_config',
	ensure => 'present',
	line => 'PermitRootLogin no',
	match => '^PermitRootLogin',
	notify => Service['sshd'],
}

# The BIG Three
 - The 3 big resources are:
	• Package
	• Service
	• File
 - Many tasks can be managed using	these resources

## Organize Code On Server
 - Creating or own modules will help us reuse and organize code on the server.
 - Modules can be shared or created within an environment
 - We only have the production environment so we will use that
