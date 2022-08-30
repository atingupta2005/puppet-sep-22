# SSL directory (ssldir)
- Puppet stores its certificate infrastructure in the SSL directory (ssldir) which has a similar structure on all Puppet nodes, whether they are agent nodes, primary Puppet servers, or the certificate authority (CA) server.

## Location
- By default, the ssldir is a subdirectory of the confdir.

## Contents
- The ssldir contains Puppet certificates, private keys, certificate signing requests (CSRs), and other cryptographic documents.
