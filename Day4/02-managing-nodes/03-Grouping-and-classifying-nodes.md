# Grouping and classifying nodes
- Configure nodes by assigning classes, parameters, and variables to them. This is called classification.

## To classify nodes, you must:
- Create node groups to contain nodes and preferences (classes, parameters, and variables) you want to apply to nodes in the group
- Make sure you understand the Best practices for classifying node groups and the difference between Environment versus classification node groups.
- Add nodes to groups.
- Declare classes and Define data used by node groups. You might need to Enable data editing in the console.

### Note
- Nodes can belong to multiple node groups, and they inherit classes, class parameters, and variables from all node groups they belong to.
- After classifying nodes, you can View nodes in a node group and Make changes to node groups.

## How node group inheritance works
- Node groups are organized in a parent-child-grandchild hierarchy
- When added to a group, nodes inherit classes, parameters, variables, and rules from their immediate node group and the group's ancestors.
### CAUTION:
- Because nodes can belong to multiple groups in separate hierarchies, it’s possible for two node groups to contribute conflicting variable or class parameter values. Conflicting values cause Puppet runs on agent nodes to fail.

## Environment versus classification node groups
- Environment node groups assign environments to nodes, such as test, development, or production
- Classification node groups assign classification data to nodes

## Create environment node groups
- In the console, click Node groups, and click Add group.
- Specify options for the new node group
- Each node can belong to only one environment node group.

## Create classification node groups
- Classification node groups assign classification data to nodes.
- In the console, click Node groups, and click Add group.
- Specify options for the new node group:
  - Parent name: Select the classification node group that you want to be the parent of your new classification node group. Classification node groups inherit classes, parameters, and variables from their parent node group. The default parent node group is the All Nodes node group.
  - Group name: Enter a name that describes the classification node group's role. For example, Web Servers.
  - Environment: Specify an environment to limit the classes and parameters available for selection in this node group.
  - Specifying the Environment in a classification node group only filters the available classes and parameters. It does not assign an environment to the nodes in the group (as is the case in environment node groups).
  - Environment group: Do not select this option.
- Click Add

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

### Set variables
- Variables you set in the console become top-scope variables available to all Puppet manifests.
- In the console, click Node groups and select the node group you want to set a variable for.
- On the Variables tab, enter the name of the variable in the Key field, and enter the value you want to assign to the variable in the Value field.
- Click Add variable and commit changes

### View nodes in a node group
- In the console, click Node groups and select the node group you want to view.
- Click Matching nodes.
