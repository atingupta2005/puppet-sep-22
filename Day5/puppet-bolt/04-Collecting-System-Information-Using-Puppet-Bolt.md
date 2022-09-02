# Collecting System Information Using Puppet Bolt
- As a system administrator collecting information about what version of software is installed or what’s the setting in a particular file across dozens or hundreds of systems is a fairly common task
- Puppet Bolt provides an excellent framework to allow the focus to be on fetching the valuable information from the systems

## Create Bolt Project
```
mkdir -p system-info; cd system-info
bolt project init systeminfo
```

## Create a Systeminfo Task
- With the bolt project instantiated we are now ready to create our Bolt tasks for fetching the information from our systems.
```
mkdir -p tasks; cd tasks
```

- We are now ready to create our script that checks the system for Docker and to see if it is running.
```
nano checkdocker.sh
```


```
#!/bin/bash
output=$(docker ps 2>&1)
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Docker is not present or running"
else
    echo "Docker is present and running"
fi
```

- Now that we have the shell script for checking a Docker installation we just need to create a metadata file for our task that provides information about the task.

```
nano checkdocker.json
```

```
{
  "description": "Check if docker is install and running",
  "input_method": "stdin",
  "parameters": {}
}
```

- We can now verify that Bolt recognizes our new task by running the following command that lists registered Bolt tasks.
```
bolt task show | grep docker
```

- If the task registers properly the output should include a systeminfo::checkdocker entry.

## Run the systeminfo::checkdocker task
```
bolt task run systeminfo::checkdocker --no-host-key-check --user root -p <My-Password> --targets 40.87.44.136,52.151.249.176
```
