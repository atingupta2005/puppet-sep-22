# PQL
- PQL stands for Puppet Query Language
- Much like SQL, it allows you to search a database and return raw data that is being stored
- PQL is an easy to use syntax that acts as a wrapper for making REST API calls to the PuppetDB endpoint

## How do I use PQL?
### Certnames of nodes (inactive and active)
```
puppet query "nodes[certname]{node_state = 'inactive' or node_state = 'active'}"
```

### Total number of nodes where an agent ran in the Production environment
```
puppet query "nodes[count()]{catalog_environment = 'production'}"
```

### The latest report for a node
```
puppet query "reports{latest_report? = true and certname = ''}"
```

### Return the certname of nodes that Have not checked into the master within the last hour
```
puppet query "reports[certname]{ latest_report? = true and receive_time < \"$(date -u -d'1 hours ago' '+%Y-%m-%dT%TZ')\"}"
```

### Check the file resource managing of the PE license
```
puppet query "resources{title = '/etc/puppetlabs/license.key'}"
```

### List all resources on a particular node
```
puppet query "resources[]{certname = ''}"
```

### Return the: certname, timestamp, resource type, resource title, message and old and new values from events where the status of the event was success
```
puppet query "events[certname, timestamp, resource_type, resource_title, message, old_value, new_value]{latest_report? = true and status='success'}"
```

### List all events that occurred on a node between run that started at 9am on 14/08/18 Zulu Time and 11am on 14/08/18 Zulu Time
```
puppet query "events[]{certname = ‘$(puppet config print certname)’ and (run_start_time >= '2018-08-14T09:00:00Z' and run_start_time <= '2018-08-14T11:00:00Z')} "
```

### Return the count of nodes where the osfamily is RedHat
```
puppet query "facts[count()]{name='osfamily' and value='RedHat'}"
```

### Return the certnames of all nodes where the osfamily is RedHat
```
puppet query "facts[certname]{name='osfamily' and value='RedHat'}"
```

### Return the certname of all nodes that are running Puppet version 5.5.3
```
puppet query "facts[certname]{name='puppetversion' and value='5.5.3'}"
```

### Return the certnames of nodes that have a specified class applied (The MCO class in this example)
```
puppet query "resources[certname]{type = 'Class' and title = Puppet_enterprise::Mcollective::Service}"
```
