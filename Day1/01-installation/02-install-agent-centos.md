# Add nodes to the inventory
- Refer: https://puppet-enterprise-guide.com/theory/node-inventory.html
- Update OS
```
sudo yum update -y
yum install -y net-tools curl wget vim nano bash-completion
```
- First on Master Console UI need to add the node and run the command on the node to install the agent
- In case we need to add class, follow below steps
  - You can add additional agent packages by navigating to Node Groups.
  - Expand the PE infrastructure by clicking the ⊞ sign, then click the PE Master node group.
  - Navigate to the Classes tab.
  - Under Add new class, enter the corresponding class name for each target agent platform (see common-platform-examples below)
  - Once you’ve selected your relevant class, click Add class.
  - When you’re done, click Commit 1 Change.
  - You’ll now need to perform a Puppet run on the primary Puppet server in order for the agent package to be downloaded.
  - Ensure you are still within the PE Master node group and click Run > Puppet in the top right of the page and then Run job.

- Connect to the VM using SSH and run below commands
```
sudo su
cat /etc/hosts
# echo "<puppet-master-private-ip>" puppet >> /etc/hosts
# echo 10.1.0.4 puppet >> /etc/hosts
cat /etc/hosts
sudo /opt/puppetlabs/bin/puppet agent -t
puppet -V
tail -f /var/log/syslog
```

## View the client cert fingerprint
```
sudo puppet agent --fingerprint
```

## View all certificates on Puppet Master:
```
sudo /opt/puppetlabs/bin/puppetserver ca list --all
```


## View pending certificate signing requests on Puppet Master:
```
sudo /opt/puppetlabs/bin/puppetserver ca list
```

## Sign pending certificate signing requests on Puppet Master:
```
sudo /opt/puppetlabs/bin/puppetserver ca sign --all
sudo /opt/puppetlabs/bin/puppetserver ca list
```
