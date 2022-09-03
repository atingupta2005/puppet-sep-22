# Puppet r10k
## Refer:
 - https://github.com/atingupta2005/puppet_env
 - https://puppet.com/docs/pe/2019.8/r10k_commands.html
 - https://sites.google.com/site/mrxpalmeiras/puppet/puppet-module-control-with-r10k
 - https://github.com/puppetlabs/r10k/blob/main/doc/dynamic-environments/quickstart.mkd
 - https://rnelson0.com/2014/05/19/puppet-and-git-201-r10k-setup-installation/
 - https://codingbee.net/puppet/puppet-r10k
 - https://rnelson0.com/2014/05/19/puppet-and-git-201-r10k-setup-installation/
 - https://rnelson0.com/2014/05/05/puppet-and-git-101-git-basics/
 - https://rnelson0.com/2014/05/26/puppet-and-git-202-r10k-setup-conversion-deployment/
 - https://forge.puppet.com/modules/puppet/r10k
 - https://www.reddit.com/r/Puppet/comments/7h7v8r/wtf_am_i_doing_wrong_with_my_code_manager/

## Install
```
/opt/puppetlabs/puppet/bin/gem install r10k
r10k help
```

## Configure r10k
```
vim /etc/puppetlabs/r10k/r10k.yaml
```
```
---
cachedir: /var/cache/r10k
sources:
  puppet:
    basedir: /etc/puppetlabs/code/environments
    remote: git@github.com:atingupta2005/puppet_env.git


git:
    private_key: /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa
    provider: rugged
```

```
cd /etc/puppetlabs/code
mv environments environments_bkp
mkdir environments
cd environments
git clone git@github.com:atingupta2005/puppet_env.git .
vim Puppetfile
r10k puppetfile check
git add Puppetfile
git commit -m "-"
git branch -M production
git push origin production
r10k deploy environment
r10k deploy environment -pv
tree .
```
