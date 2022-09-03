# Getting started with Bolt
## Create a Bolt project and set up targets
```
mkdir -p ~/my_project; cd ~/my_project
bolt project init my_project
```

## Run a command on a localhost
```
bolt command run whoami -t 127.0.0.1:22 -u root -p <my-password> --no-host-key-check
```

### Create an inventory file to group your targets
- When you set up your Bolt project, Bolt created an inventory file template named inventory.yaml in your project directory
- Replace the contents of that file with the following:
```
cd ~/my_project
vi inventory.yaml
```
```
groups:
- name: containers
  targets:
    - uri: 40.87.44.136
      name: target1
    - uri: 52.151.249.176
      name: target2
  config:
    transport: ssh
    ssh:
      user: root
      password: <my-password>
      host-key-check: false
```

## Test
```
bolt command run whoami -t target1
bolt command run whoami -t containers
bolt command run whoami -t all
```
