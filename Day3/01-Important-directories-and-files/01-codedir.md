# Code and data directory (codedir)
- The codedir is the main directory for Puppet code and data
- It is used by the primary Puppet server and Puppet apply, but not by Puppet agent.
- It contains environments (which contain your manifests and modules), a global modules directory for all environments, and your Hiera data and configuration.

## Location
- The codedir is located in one of the following locations:
  - *nix: /etc/puppetlabs/code
  - Windows: %PROGRAMDATA%\PuppetLabs\code (usually C:\ProgramData\PuppetLabs\code)

- To configure the location of the codedir, set the  codedir setting in your puppet.conf file, such as:

### Contents
- The codedir contains environments, including manifests and modules, a global modules directory for all environments, and Hiera data.
- The code and data directories are:
  - environments : Contains alternate versions of the modules and manifests directories, to enable code changes to be tested on smaller sets of nodes before entering production.
  - modules : The main directory for modules.
