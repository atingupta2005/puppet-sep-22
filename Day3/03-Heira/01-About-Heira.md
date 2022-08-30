# About Heira
- Hiera is a built-in key-value configuration data lookup system, used for separating data from Puppet code.

- Puppet uses Hiera to do two things:
  - Store the configuration data in key-value pairs
  - Look up what data a particular module needs for a given node during catalog compilation

- Hiera’s hierarchical lookups follow a “defaults, with overrides” pattern

## Hiera hierarchies
- Hierarchies are configured in a hiera.yaml configuration file
