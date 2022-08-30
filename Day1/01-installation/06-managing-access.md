# Managing access
## Create a user
- In the console, on the Access control page, click the Users tab.
- In the Full name field, enter the user's full name.
- In the Login field, enter a user name for the user.
- Click Add local user.

## Give a user access to the PE console
- On the Access control page, on the Users tab, select the user's full name.
- Click Generate password reset.
- Copy the link provided in the message and send it to the new user.

## Create a user role
- Puppet Enterprise (PE) includes five default roles. You can also create your own roles.
- In the console, on the Access control page, click the User roles tab.
- In the Name field, enter a name for the new user role.
- Click Add role.


## Assign permissions to a user role
- On the Access control page, on the User roles tab, select a user role.
- Click Permissions.
- In the Type field, select the type of object you want to assign permissions for, such as Node groups.
- In the Permission field, select the permission you want to assign, such as View.
- In the Object field, select the specific object you want to assign the permission to. For example, if you are setting a permission to view node groups, select a specific node group this user role has permissions to view.
- Click Add permission, and commit changes.

## Add a user to a user role
- When you add a user to a role, the user gains the permissions you assign to that role
- A user can't do anything in PE until they have been assigned to at least one role.
- If users are assigned to multiple roles, they get all permissions from all roles they are assigned to.

- On the Access control page, on the User roles tab, select a user role.
- Click Member users.
- In the User name field, select the user you want to add to the user role.
Click Add user, and commit changes.
