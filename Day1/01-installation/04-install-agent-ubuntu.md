# Add nodes to the inventory
- First on Master Console UI need to add the node and run the command on the node to install the agent
- Connect to the VM using SSH and run below commands
```
sudo su
cat /etc/hosts
# sudo echo "<puppet-master-private-ip>" puppet >> /etc/hosts
# sudo echo 10.1.0.4 puppet >> /etc/hosts
cat /etc/hosts
sudo puppet agent --test
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
