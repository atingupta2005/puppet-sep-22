sudo bash -c 'echo 40.87.12.160 puppet vmpuppetmstr.myl52jycogeulm2bcfcy5sblqd.bx.internal.cloudapp.net >> /etc/hosts';uri="https://puppet:8140/packages/current/install.bash";curl -k "$uri" | sudo bash;puppet agent -t
