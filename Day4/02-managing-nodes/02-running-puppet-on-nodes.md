# Running Puppet on nodes
- Puppet automatically attempts to run on each of your nodes every 30 minutes. To trigger a Puppet run outside of the default 30-minute interval, you can manually trigger a Puppet run.
- In a Puppet run, the primary server and agent nodes perform these actions:
  - Each agent node sends facts to the primary server and requests a catalog.
  - The primary server compiles and returns each agent's catalog.
  - Each agent applies the catalog by checking each resource the catalog describes. If the agent finds any resources that are not in the desired state, the agent makes the necessary changes to bring the resource into the desired state.

### Running Puppet with SSH
```
puppet agent -t
```

### Running Puppet from the console
- In the console, go to Nodes and click the name of the node you want to run Puppet on.
- On the Node details page, click Run Puppet

### Activity logging when running Puppet from the console
- When you initiate a Puppet run from the console, the Activity service logs the run activity.
- You can view activity for a single node by opening the node's Node details page and switching to the Activity tab.

### Troubleshooting Puppet run failures
- Puppet Enterprise (PE) creates a View Report link for most failed runs, which you can use to access the run's events and logs. You might encounter these errors when a Puppet run fails.
#### Changes could not be applied
- Usually caused by conflicting classes. Check the run log to get information.
- This error can also occur when running in no-op mode.
#### Run already in progress
- Occurs when you try to trigger a Puppet run on a node, but there is already a Puppet run in progress. This could be a scheduled run or a run started by another user.
#### Run request times out
- Occurs if you attempt to start a Puppet run but the agent isn’t available.
#### Report request times out
- Occurs when the run report is not successfully stored in PuppetDB after the run completes.
#### Invalid response, such as a 500 error
- Some part of the request is invalid
- If you used the command line or the orchestrator API to start the Puppet run, check the formatting of your command or request
- If you're using the console, or your command or request is well-formed, your Puppet code might be have incorrect formatting.
#### In the console, the Run button is disabled and a run is not allowed.
- You have permission to run Puppet on the node, but the agent is not responding.
