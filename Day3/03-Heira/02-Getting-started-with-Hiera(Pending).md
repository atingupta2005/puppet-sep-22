# Getting started with Hiera
## Create a hiera.yaml config file
- The Hiera config file is called hiera.yaml
- Each environment should have its own hiera.yaml file.
- In the main directory of one of your environments, create a new file called hiera.yaml
- Paste the following contents into it:
```
# <ENVIRONMENT>/hiera.yaml
---
version: 5
hierarchy:
  - name: "Per-node data"                   # Human-readable name.
    path: "nodes/%{trusted.certname}.yaml"  # File path, relative to datadir.
                                   # ^^^ IMPORTANT: include the file extension!
  - name: "Per-OS defaults"
    path: "os/%{facts.os.family}.yaml"

  - name: "Common data"
    path: "common.yaml"
```

## The hierarchy
- The hiera.yaml file configures a hierarchy: an ordered list of data sources.
- Hiera searches these data sources in the order they are written

## Write data: Create a test class
- A test class writes the data it receives to a temporary file — on the agent when applying the catalog.
