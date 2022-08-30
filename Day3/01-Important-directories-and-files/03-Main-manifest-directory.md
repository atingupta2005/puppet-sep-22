# Main manifest directory
- Puppet starts compiling a catalog either with a single manifest file or with a directory of manifests that are treated like a single file. This starting point is called the main manifest or site manifest.

## Specifying the manifest for Puppet apply
```
puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp
```


## Specifying the manifest for primary Puppet server
- The primary Puppet server uses the main manifest set by the current node's environment
- By default, the main manifest for an environment is <ENVIRONMENTS DIRECTORY>/<ENVIRONMENT>/manifests
- The default_manifest setting defaults to ./manifests

- To check which manifest your primary server uses for a given environment, run:
```
puppet config print manifest --section server
```

## Manifest directory behavior
- When the main manifest is a directory, Puppet parses every .pp file in the directory in alphabetical order and evaluates the combined manifest
- Puppet treats the directory as one manifest, so, for example, a variable assigned in the file 01_all_nodes.pp is accessible in node_web01.pp.
