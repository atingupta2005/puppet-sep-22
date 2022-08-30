# Configure ulimit
- As your infrastructure grows and you use Puppet Enterprise (PE) to manage more agents, you might need to increase the number of allowed file handles per client.
- PE services can require as much as one file handle per connected client
- The default ulimit settings for most operating systems can only support up to about 200 clients
- To support more clients, you need to increase the number of allowed file handles.

## Configure ulimit using systemd
- With systemd, the allowed number of open file handles is controlled by the LimitNOFILE setting in the .service file each PE service.
- Locate the systemd .service file for the PE service you want to configure and copy the file path. The default file path is:
```
/usr/lib/systemd/system/<PE_SERVICE>.service
```

- For example, the file path for the PuppetDB service systemd file is:
```
/usr/lib/systemd/system/pe-puppetdb.service
```

- Using the file path you determined in the previous step, run the following commands to increase the ulimit. Make sure to set the LimitNOFILE value to the desired file handles limit.
```
mkdir /etc/systemd/system/<PE_SERVICE>.service.d
echo "[Service]LimitNOFILE=32678" > /etc/systemd/system/<PE_SERVICE>.service.d/limits.conf
systemctl daemon-reload
```

- To confirm the change, run
```
systemctl show <PE_SERVICE> | grep LimitNOFILE
```

## Configure ulimit using upstart
- For Ubuntu and Red Hat systems, the allowed number of open file handles is specified in system configuration files for each PE service.
- Locate the file for the PE service you want to configure. The location depends on the platform, and the file name matches the PE service name (as listed in Configure ulimit).
  - Ubuntu: /etc/default/<PE_SERVICE>
  - Red Hat: /etc/sysconfig/<PE_SERVICE>
- Set the ulimit setting on the last line of the file as follows:
  - ulimit -n <ULIMIT_VALUE>
- For example, this configuration set the allowed number of open files to 32,678:
  - ulimit -n 32678
