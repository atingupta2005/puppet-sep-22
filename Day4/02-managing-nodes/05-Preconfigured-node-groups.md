# Preconfigured node groups
- Puppet Enterprise includes preconfigured node groups that are used to manage your configuration.

## All Nodes node group
- This node group is at the top of the hierarchy tree. All other node groups stem from this node group.

### Classes
- No default classes. Avoid adding classes to this node group.

### Matching nodes
- All nodes.

## Infrastructure node groups
- Infrastructure node groups are used to manage PE.
#### Important: Don't make changes to infrastructure node groups

### PE Infrastructure node group
- The PE Infrastructure node group is the parent to all other infrastructure node groups
- This node group contains data, such as the service hostnames, service ports, and database info (excluding passwords).

## PE Certificate Authority node group
- This node group is used to manage the certificate authority.

## PE Master node group
- This node group is used to manage the primary server.

## PE Patch Management node group
- This is a parent node group for nodes under patch management. Create child node groups based on your needs.
