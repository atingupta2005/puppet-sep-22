# Troubleshooting password
## Generate a user password reset token
- When users forget their passwords, you must generate a password reset token.

- In the console, on the Access control page, click the Users tab.
- Click the name of the user who needs a password reset token.
- Click Generate password reset, copy the link, and send it to the user.

## Reset the console administrator password
- If you're unable to log in to the console as admin, you can change the password from the command line of the node that is running console services.
- On the node running console services (usually your primary server), log in as root.
- To reset the console admin password, run:
```
puppet infrastructure console_password --password=<MY_PASSWORD>
```

## Troubleshooting PE admin account access
### Multiple admin users
- If your directory has multiple users with admin as their login name, the PE admin account can't log in.

### PE admin locked out
- If you are locked out of the PE admin account, ask another use with administrator access to Generate a user password reset token for the admin user.

### Create a custom login disclaimer
- You can add a custom banner to console login page. For example, you can add a disclaimer about authorized or unauthorized use of private information found in the console.
- Create a disclaimer.txt file containing the disclaimer content.
- Place the file in /etc/puppetlabs/console-services
