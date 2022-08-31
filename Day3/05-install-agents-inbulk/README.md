# Install puppet agent in bulk

 - If you're installing an agent with a different OS than your primary server, you must declare the corresponding pe_repo class on the primary server, such as pe_repo::platform::el_7_x86_64.
 - You can declare these classes in the console at Node Groups > PE Master > Classes.

- Create shell script on local computer with below content. Refer: puppet_install.sh
- Note: Also replace the Puppet Master IP and the Puppet Master Host Name in the script below
```
sudo bash -c 'echo 40.87.12.160 puppet vmpuppetmstr.myl52jycogeulm2bcfcy5sblqd.bx.internal.cloudapp.net >> /etc/hosts';uri="https://puppet:8140/packages/current/install.bash";curl -k "$uri" | sudo bash;puppet agent -t
```

- Run below commands on local computer.
- Note replace the IP address, username and the password
```
sudo yum install -y sshpass
MACHINE_IP="20.232.37.141"
USER_ID="akhila"
PASSWORD="Akhila@7731941941"
sshpass -p $PASSWORD ssh -o StrictHostKeychecking=no $USER_ID@$MACHINE_IP 'bash -s' < puppet_install.sh
```
