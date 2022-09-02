# Write a Bolt plan
- Plans allow you to tie your commands, scripts, and tasks together to create powerful workflows.
- Let's write a YAML plan that installs the Apache package on your Docker targets, starts the Apache service, and uploads an HTML homepage.

## Use a task to install Apache on your targets
- The first step in your YAML plan uses a Puppet task to install Apache on your targets.

- Create folder structure
```
cd ~/my_project
mkdir -p modules/apache/plans; mkdir -p modules/apache/files
tree .
```

- Output
```
.
├── bolt-debug.log
├── bolt-project.yaml
├── inventory.yaml
└── modules
    └── apache
        ├── files
        └── plans
```

```
nano modules/apache/plans/install.yaml
```

```
parameters:
  targets:
    type: TargetSpec
  src:
    type: String

steps:
  - name: install_apache
    task: package
    targets: $targets
      action: install
      name: httpd
    description: "Install Apache using the packages task"
  - name: start_apache
    script: apache/start_apache.sh
    targets: $targets
    description: "Starting Apache service"
  - name: upload_homepage
    upload: $src
    destination: /var/www/html/index.html
    targets: $targets
    description: "Upload homepage"
```

- Script to start Apache process
```
nano modules/apache/start_apache.sh
```

```
#!/usr/bin/env bash

i=`ps -eaf | grep -i apache | grep -v grep | grep -v bash | wc -l`

if [[ $i > 0 ]]
then
  echo "Apache is running"
else
  echo "Starting Apache"
  apache2ctl start
fi
```

## Upload an HTML homepage to your targets
```
nano modules/apache/files/index.html
```

```
<html>
  <head>
    <title> Getting started with Bolt </title>
  </head>
  <body>
    <h1>Success!</h1>
    <p>I'm running this website on a server configured with Bolt!</p>
  </body>
</html>
```

- Verify the folder structure
```
tree .
```

- Output
```
.
├── bolt-debug.log
├── bolt-project.yaml
├── inventory.yaml
└── modules
    └── apache
        ├── files
        │   └── index.html
        └── plans
            ├── install.yaml
            └── start_apache.sh
```

- Run the plan:
```
bolt plan run apache::install -t containers src=apache/index.html
```

- Test
```
curl 40.87.44.136
curl 52.151.249.176
```
