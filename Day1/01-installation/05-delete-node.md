# Delete node
## Remove agent
### On Master
```
sudo /opt/puppetlabs/bin/puppetserver ca list --all
sudo puppet node purge <CERTNAME>
sudo /opt/puppetlabs/bin/puppetserver ca clean --certname <CERTNAME>
```

### On node
```
puppet ssl clean
sudo puppet resource service puppet ensure=stopped
puppet config print ssldir --section agent
ls /home/atingupta2005/.puppetlabs/etc/puppet/ssl
mv /home/atingupta2005/.puppetlabs/etc/puppet/ssl /home/atingupta2005/.puppetlabs/etc/puppet/ssl_bkp1
ls /home/atingupta2005/.puppetlabs/etc/puppet/ssl
```
