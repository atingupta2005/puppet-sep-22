# Using Templates
 - We can use templates to customize configuration files
 - We can use a template to make sure a local time zone is used to the agents timezone.

## Simple Template
 - A simple template like this may work for the /etc/motd file. We can test the result with puppet epp render
 - Connect to the Server
```
vim test.epp
```

```
<%= $facts['ipaddress'] %> <%= $facts['fqdn'] %>
```

```
sudo puppet epp render test.epp
```
