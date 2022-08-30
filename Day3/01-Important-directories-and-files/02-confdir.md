# Config directory (confdir)
- Puppet’s confdir is the main directory for the Puppet configuration. It contains configuration files and the SSL data.

## Location
- The confdir is located in one of the following locations:
  - *nix root users: /etc/puppetlabs/puppet
  - Windows: %PROGRAMDATA%\PuppetLabs\puppet\etc (usually C:\ProgramData\PuppetLabs\puppet\etc)

- Puppet’s confdir can’t be set in the puppet.conf, because Puppet needs the confdir to locate that config file.
- Instead, run commands with the --confdir parameter to specify the confdir
- If --confdir isn’t specified when a Puppet application is started, the command uses the default confdir location.

## Contents
- The confdir contains several config files and the SSL data.

- On all nodes, agent and primary server, the confdir contains the following directories and config files:
  - ssl directory: contains each node’s certificate infrastructure.
  - puppet.conf: Puppet’s main config file.
  - csr_attributes.yaml: Optional data to be inserted into new certificate requests.

- On primary server nodes, and sometimes standalone nodes that run Puppet apply, the confdir also contains:
  - auth.conf: Access control rules for the primary server's network services.
  - fileserver.conf: Configuration for additional fileserver mount points.
  - hiera.yaml: The global configuration for Hiera data lookup. Environments and modules can also have their own hiera.yaml files.
