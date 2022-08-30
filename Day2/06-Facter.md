# Facter
- Facter is Puppet’s cross-platform system profiling library. It discovers and reports per-node facts, which are used in your Puppet manifests as variables.

- In Puppet, there are three types of fact that can be used and defined −
  - Core Facts
  - Custom Facts

## Core Facts
- Built-in facts
- You can access facts in your Puppet manifests as $fact_name or $facts[fact_name].
```
$ facter
$ facter {Variable Name}
```
- The reason why facter is important for Puppet is that facter and facts are available throughout Puppet code as “global variable”, which means it can be used in the code at any point of time without any other reference.



## Custom facts
- You can add custom facts by writing snippets of Ruby code on the primary Puppet server
```
export FACTER_tallest_mountain="Everest"
```
