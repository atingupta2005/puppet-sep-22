# How to configure PE
- After you've installed Puppet Enterprise (PE), you can optimize it by configuring and tuning settings.

## Three ways to configure PE settings:
- Configure settings in the PE console
- Configure settings with Hiera
- Configure settings in pe.conf

## Configure settings in the PE console
- You can use the Puppet Enterprise (PE) console's graphical interface to configure settings for your PE installation.
- Changes you make in the console override your Hiera data and data in pe.conf. It is best to use the console when you want to:
  - Change parameters in profile classes starting with puppet_enterprise::profile.
  - Add parameters to PE-managed configuration files.
  - Set parameters that configure at runtime.

- Note: To change settings in the console you can Set configuration data or Set parameters.

### Set configuration data
- Configuration data set in the console is used for automatic parameter lookup
- Console configuration data takes precedence over Hiera
#### Steps
- In the console, click Node groups and select the node group that you want to add configuration data to.
- On the Configuration data tab, specify a Class and select a Parameter to add
  - You can select from existing classes and parameters in the node group's environment, or you can specify free-form values. Classes aren’t validated, but any class you specify must be present in the node’s catalog at runtime in order for the parameter value to be applied.
  - When you select a parameter, the Value field is automatically populated with the inherited or default value.

### Set parameters
- Can use parameters to override other data
### Steps
- In the console, click Node groups and select the node group you want to add a parameter to.
- On the Classes tab, select the class you want to modify, and select the Parameter you want to add.
- The Parameter list shows all parameters available for the selected class in the node group’s environment. When you select a parameter, the Value field is automatically populated with the inherited or default value.


## Configure settings with Hiera
- Hierarchy-based configuration management
- Changes to PE configuration settings in Hiera override configuration settings in pe.conf, but not those set in the PE console
- However, settings declared in the console override Hiera data. It's best to use Hiera
### To configure a setting in Hiera:
- Open a Hiera data file in a text editor.
  - The default location for Hiera data files on *nix systems is:
    - /etc/puppetlabs/code/environments/<ENVIRONMENT>/data/common.yaml
- Add your new parameter to the Hiera data file
```
puppet_enterprise::console_services::no_longer_reporting_cutoff: 4000
```
- Save the file and run puppet agent -t to compile the changes.


## Configure settings in pe.conf
- PE configuration settings made in Hiera and the console always override settings made in pe.conf
- On your primary server, open the pe.conf file in a text editor. The file is located at:
  - /etc/puppetlabs/enterprise/conf.d/pe.conf
- Add the parameter and value you want to set.
  - For example, this declaration changes the proxy location in your PE repo:
```
pe_repo::http_proxy_host: "proxy.example.vlan"
```
- Save the file and run puppet agent -t
