# Configure PuppetDB
## Disable agent run reports
- By default, every time Puppet runs, your Puppet Enterprise (PE) primary server generates agent run reports and submits them to PuppetDB. You can disable agent run reports.

- In the PE console, navigate to Node groups > PE Infrastructure > PE Master.
- On the Classes tab, add the puppet_enterprise::profile::master::puppetdb class.
- Add the report_processor_ensure parameter, and set the value to either:
  - "present": Enable agent run reports
  - "absent": Disable agent run reports
- Click Add parameter and commit changes.
- On the nodes hosting your primary server and PE console, run Puppet.

## Set the deactivated node retention time
- Use the node-purge-ttl parameter to set the length of time before PE automatically removes deactivated or expired nodes. Once the time limit passes, the nodes and their relevant facts, catalogs, and reports are only removed from PuppetDB. Agent certificates on the Certificate Authority (CA) server are untouched.

- In the PE console, navigate to Node groups > PE Infrastructure > PE PuppetDB.
- On the Classes tab, find the puppet_enterprise::profile::puppetdb class.
- Add the node_purge_ttl parameter, and set the value to a string representing the desired retention time

- For example, to set the purge time to 14 days, set the value to 14d. For example:
```
puppet_enterprise::profile::puppetdb::node_purge_ttl: '14d'
```

## Change the PuppetDB user password
- The Puppet Enterprise (PE) console uses a database user account to access its PostgreSQL database
- Change this database user's password if it is compromised or to comply with your organization's security guidelines.

- Stop the pe-puppetdb service by running:
```
puppet resource service pe-puppetdb ensure=stopped
```
- Change password
```
ALTER USER console PASSWORD '<new password>';
```
- On the PuppetDB server, open the database.ini file located at /etc/puppetlabs/puppetdb/conf.d/database.ini, and change the password line to reflect the new password.

- Save the file and restart the pe-puppetdb service on the console server by running:
```
puppet resource service pe-puppetdb ensure=running
```
