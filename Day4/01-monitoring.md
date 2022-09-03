# Monitoring and reporting
- The Puppet Enterprise (PE) console has several tools you can use to monitor the current state of your infrastructure, review the results of planned or unplanned changes to your Puppet code, view reports, and investigate problems
- Configure using the file
  - /etc/puppetlabs/puppet/puppet.conf

## Monitoring infrastructure state
### Node run statuses
- The Status page displays each node's run status for the most recent Puppet run.
- Possible statuses depend on the Puppet run mode.

- Returns errors and alerts from Puppet Enterprise (PE) components and services.
```
puppet infrastructure status
```


## Viewing and managing packages
- The Packages page in the console shows all packages in use across your infrastructure

### Enable package data collection
- Package data collection is disabled by default, so the Packages page in the console initially appears blank.

#### Steps
- In the console, click Node groups.
If you want to collect package data on all your nodes, click the PE Agent node group.
  - If you want to collect package data on a subset of your nodes, click Add group and create a new classification node group
  - Select PE Agent as the group's parent name
  - After the new node group is set up, use the Rules tab to dynamically add the relevant nodes.

- Click Classes. In the Add new class field, select puppet_enterprise::profile::agent and click Add class.
- In the puppet_enterprise::profile::agent class, set the Parameter to package_inventory_enabled and the Value to true. Click Add parameter, and commit changes.
- Run Puppet to apply these changes to the nodes in your node group.
- Puppet enables package inventory collection on this Puppet run, and begins collecting package data and reporting it on the Packages page on each subsequent Puppet run.
- Run Puppet a second time to begin collecting package data, then click Packages.

### View and manage package inventory
- Run Puppet to collect the latest package data from your nodes.
- In the console, click Packages to view your package inventory. To narrow the list of packages, enter the name or partial name of a package in the Filter by package name field and click Apply.
- Click any package name or version to enter the detail page for that package.
- On a package's detail page, use the Version selector to locate nodes with a particular package version installed.
- Use the Instances selector to locate nodes where the package is not managed with Puppet, or to view nodes on which a package instance is managed with Puppet.
- To quickly find the place in your manifest where a Puppet-managed package is declared, select a code path in the Instances selector and click Copy path.

- To modify a package on a group of nodes:
  - If the package is managed with Puppet, select a code path in the Instances selector and click Copy path, then navigate to and update the manifest.

## Infrastructure reports
- Each time Puppet runs on a node, it generates a report that provides information such as when the run took place, any issues encountered during the run, and the activity of resources on the node
- These reports are collected on the Reports page in the console.

### Working with the reports table
- The Reports page provides a summary view of key data from each report
- Use this page to track recent node activity so you can audit your system and perform root cause analysis over time.

## Analysing changes across Puppet runs
- The Events page in the console shows a summary of activity in your infrastructure.
- You can analyse the details of important changes, and investigate common causes behind related events
- You can also examine specific class, node, and resource events, and find out what caused them to fail, change, or run as no-op.

### What is an event?
- An event occurs whenever PE attempts to modify an individual property of a given resource
- Reviewing events lets you see detailed information about what has changed on your system, or what isn't working properly.

- During a Puppet run, Puppet compares the current state of each property on each resource to the desired state for that property, as defined by the node's catalog
- If Puppet successfully compares the states and the property is already in sync, Puppet moves on to the next resource without noting anything
- Otherwise, it attempts some action and records an event, which appears in the report it sends to the primary server at the end of the run
- These reports provide the data presented on the Events page in the console.

### Working with the Events page
- During times when your deployment is in a state of stability, with no changes being made and everything functioning optimally, the Events page reports little activity, and might not seem terribly interesting
- But when change occurs—when packages require upgrades, when security concerns threaten, or when systems fail—the Events page helps you understand what's happening and where so you can react quickly.

## Puppet Enterprise metrics
### About the puppet_metrics_collector module
- The puppet_metrics_collector module collects metrics from the status endpoints of Puppet Enterprise (PE) services.
- The puppet_metrics_collector module is installed with PE and is partially enabled by default.
Two parameters control metrics collection:
  - puppet_enterprise::enable_metrics_collection: Collect metrics from PE services, such as Puppet Server and PuppetDB. This parameter is enabled by default.
  - puppet_enterprise::enable_system_metrics_collection: Collect metrics from the operating system the PE services run on. This parameter is disabled by default.


### Enable or disable metrics collection
- The puppet_metrics_collector module is partially enabled by default, and you can manually configure the metrics collection parameters.
- These parameters accept Boolean values. Set both parameters to false to disable the module entirely.
  - In PE Infrastructure Node Group, set these parameters to either true or false to enable or disable metrics collection.
    - puppet_enterprise::enable_metrics_collection: Control metrics collection for Puppet Enterprise (PE) services.
    - puppet_enterprise::enable_system_metrics_collection: Control metrics collection for the operating system the PE services run on.
  - Run Puppet: puppet agent -t

#### Check metric data
```
cd /opt/puppetlabs/puppet-metrics-collector
grep <metric_name> <service_name>/vmpuppetmstr.myl52jycogeulm2bcfcy5sblqd.bx.internal.cloudapp.net/*.json
grep average-free-jrubies puppetserver/vmpuppetmstr.myl52jycogeulm2bcfcy5sblqd.bx.internal.cloudapp.net/*.json
```
