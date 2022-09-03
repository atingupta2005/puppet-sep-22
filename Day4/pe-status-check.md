# pe_status_check
- Refer: https://forge.puppet.com/modules/puppetlabs/pe_status_check

## Install
```
puppet module install puppetlabs-pe_status_check
cd /etc/puppetlabs/code/environments/production
```

## Configure
```
vim site.pp
```

```
node default {
  include pe_status_check
}
```

## Take Health Reports
```
puppet access login
puppet resource service puppet ensure=running
puppet query 'facts[certname,value] { name = "pe_status_check" }'
puppet query 'facts[certname,value] { name = "agent_status_check" }'
puppet query 'inventory[certname] { facts.pe_status_check.S0040 = false }'
```
