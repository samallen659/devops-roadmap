# Ansible Configuration Management Project

## Running the Playbook

You should first run the ssh role. This will copy the ssh key and disable password authentication.

```bash
ansible-playbook -i inventory.ini setup.yml --ask-pass --tags 'ssh'
```

Now run all roles against the server.

```bash
ansible-playbook -i inventory.ini setup.yml --ask-become-pass
```
