# Add nodes to the inventory
 - Your inventory is the list of nodes managed by Puppet
 - Add nodes with agents, agentless nodes that connect over SSH or WinRM, or add network devices like network switches and firewalls
 - Agent nodes help keep your infrastructure in your desired state
 - Agentless nodes do not have an agent installed, but can do things like run tasks and plans.

## Add hosts entry:
 - On each client machine add the host entry as per below:
 ```
sudo su
```

```
echo "<pe-server-ip-address> puppet <generated-domain-name>" >> /etc/hosts
```

## Add agent nodes
1. In the console, on the Nodes page, click Add nodes.
1. Click Install agents.
1. Select the transport method. This connection is used to remotely install the agent on the target node.

### Note: Make sure ports are open in Azure Networking

1. Enter the target host names and the credentials required to access them. If you use an SSH key, include begin and end tags.
1. Click Add nodes

- Agents are installed on the target nodes and then automatically submit certificate signing requests (CSR) to the primary server. The list of unsigned certificates is updated with new targets.

## Add agentless nodes
 - Add nodes that will not or cannot have an agent installed on them
 - Agentless automation allows you to do things like update a package or restart a server on demand for node targets that don't have software installed.

1. In the console, on the Nodes page, click Add nodes.
1. Click Connect over SSH or WinRM.
1. Select a transport method.
	- SSH for *nix targets
	- WinRM for Windows targets
1. Enter target host names and the credentials required to access them. If you use an SSH key, include begin and end tags.
1. Click Add nodes.

### Results
 - After the nodes have been added to the inventory, they are added to PuppetDB, and you can view them from the Nodes page
 - Nodes in the inventory can be added to an inventory node list when you set up a job to run tasks
 - To review each inventory node's connection options, or to remove the node from inventory, go to the Connections tab on the node's details page.


## Managing certificate signing requests in the console
 - A certificate signing request appears in the console on the Certificates page in the Unsigned certificates tab after you add an agent node to inventory. Accept or reject submitted requests individually or in a batch.
	- To manage requests individually, click Accept or Reject.
	- To manage the entire list of requests, click Accept All or Reject All
 - After you accept the certificate signing request
	- The node appears in the console after the next Puppet run. To make a node available immediately after you approve the request, run Puppet on demand.
