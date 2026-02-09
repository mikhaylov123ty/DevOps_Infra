# Ansible Infrastructure Automation

This part of the project automates the deployment and configuration of the Sausage Store application (backend and frontend) using Ansible.

## Project Structure

- `ansible.cfg`: Ansible configuration file.
- `inventory/`: Contains inventory files, including `yandexcloud.yaml`.
- `group_vars/`: Group-specific variables for `all`, `backend`, and `frontend`.
- `roles/`:
    - `backend`: Installs OpenJDK 16, downloads the backend JAR from Nexus, and sets up a systemd service.
    - `frontend`: Installs NodeJS/NPM, downloads the frontend artifact from Nexus, and sets up a systemd service with `http-server`.
- `playbook.yaml`: Main playbook orchestrating the deployment of both services.

## Prerequisites

1.  **Ansible installed**: Ensure you have Ansible installed on your control node.
2.  **Vault Password**: The project uses Ansible Vault for sensitive data (Nexus credentials). You need to have the vault password in a file named `.vault` in the `ansible` directory (as configured in `ansible.cfg`).
3.  **SSH Access**: Ensure you have SSH access to the target hosts using the key specified in `group_vars/all.yaml` (`~/.ssh/tf-cloud-init`).

## Configuration

### Inventory
The inventory is located in `inventory/yandexcloud.yaml`. It defines two groups: `backend` and `frontend`.

### Variables
- `group_vars/all.yaml`: Common variables including Nexus URL and SSH settings.
- `group_vars/backend.yaml`: Backend-specific variables like artifact version and paths.
- `group_vars/frontend.yaml`: Frontend-specific variables like NodeJS version and proxy settings.

## Usage

To run the deployment playbook, navigate to the `ansible` directory and execute:

```bash
ansible-playbook playbook.yaml
```

If you need to target a specific service, you can use tags (if available) or run the playbook normally as it targets both groups defined in the inventory.

### Working with Vault
The following variables are encrypted with Ansible Vault in `group_vars/all.yaml`:
- `NEXUS_REPO_USER`
- `NEXUS_REPO_PASS`

Since `ansible.cfg` points to `.vault`, you don't need to provide `--vault-password-file` manually if the file exists.
Just create your own .vault file with vault pass, re-create credentials and update variables.
