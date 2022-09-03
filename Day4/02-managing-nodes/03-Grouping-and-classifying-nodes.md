### Note
- Nodes can belong to multiple node groups, and they inherit classes, class parameters, and variables from all node groups they belong to.
- After classifying nodes, you can View nodes in a node group and Make changes to node groups.

## How node group inheritance works
- Node groups are organized in a parent-child-grandchild hierarchy
- When added to a group, nodes inherit classes, parameters, variables, and rules from their immediate node group and the group's ancestors.
### CAUTION:
- Because nodes can belong to multiple groups in separate hierarchies, it’s possible for two node groups to contribute conflicting variable or class parameter values. Conflicting values cause Puppet runs on agent nodes to fail.

## Add nodes to a node group
- There are two ways to add nodes to a node group.
- You can Statically add individual nodes to a node group or use fact-based rules to Dynamically add nodes to a node group.
- With dynamic node group rules, Puppet Enterprise (PE) automatically adds and removes nodes from your groups based on the rules you set, whereas you must manually add or remove static (pinned) nodes.

### Statically add nodes to a node group
- You can pin individual nodes to node groups.
- In the console, click Node groups and select the node group that you want to pin the node to.
- On the Rules tab, enter the node's certname in the Certname field.
- Click Pin node and commit changes.

### Dynamically add nodes to a node group
- In the console, click Node Groups and select the node group you want to add nodes to.
- On the Rules tab, create a fact-based rule, and click Add Rule
  - For example, this rule specifies that nodes in the group must have a Red Hat OS:
```
Fact: osfamily
Operator: =
Value: RedHat
```
- Commit changes.

## Declare classes
- Classes are blocks of Puppet code that configure nodes and assign resources to nodes.
- In the Puppet Enterprise (PE) console, click Node groups and select the node group that you want to add the class to.
- On the Classes tab, select the class to add.
- Click Add class and then commit changes.

## Define data used by node groups
### Set configuration data
- Configuration data set in the PE console is used for automatic parameter lookup in the same way that Hiera data is used. Console configuration data takes precedence over Hiera
- In the console, click Node groups and select the node group that you want to add configuration data to.
- On the Configuration data tab, specify a Class and select a Parameter to add.

### Set parameters
- In the console, click Node groups and select the node group you want to add a parameter to.
- On the Classes tab, select the class you want to modify, and select the Parameter you want to add
  - The Parameter list shows all parameters available for the selected class in the node group’s environment. When you select a parameter, the Value field is automatically populated with the inherited or default value.

### View nodes in a node group
- In the console, click Node groups and select the node group you want to view.
- Click Matching nodes.
