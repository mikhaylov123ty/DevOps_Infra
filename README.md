# Yandex Cloud Infrastructure with Terraform

This project automates the deployment of a virtual machine instance in Yandex Cloud using Terraform. It leverages submodules for network and instance management.

## Project Structure

- `modules/tf-yc-network`: Fetches VPC network and subnet information.
- `modules/tf-yc-instance`: Creates the compute instance.
- `main.tf`: Root module orchestrating the infrastructure.
- `variables.tf`: Root input variables.
- `outputs.tf`: Root output definitions.

## Prerequisites

1.  **Yandex Cloud CLI installed and configured.**
2.  **Terraform installed.**
3.  **Provider Installation Setup**:
    Add the following to your `~/.terraformrc` (or equivalent):
    ```hcl
    provider_installation {
      network_mirror {
        url = "https://terraform-mirror.yandexcloud.net/"
        include = ["registry.terraform.io/*/*"]
      }
      direct {
        exclude = ["registry.terraform.io/*/*"]
      }
    }
    ```
4. **Service Account Static key**:
    Receive ID and Key for Yandex Cloud service account. Add to environment variables:
    ```
    export AWS_ACCESS_KEY_ID=<YOUR ID>
    export AWS_SECRET_ACCESS_KEY=<YOUR KEY>
    ```
5. **Yandex Cloud Token**:Receive Yandex Cloud IAM Token. Also add it to environment variable:
    ```
   export YC_TOKEN=<YOUT IAM TOKEN>
   ```
 
## Usage

1.  Initialize Terraform:
    ```bash
    terraform init
    ```

2.  Plan the infrastructure:
    ```bash
    terraform plan -var-file=terraform.tfvars
    ```

3.  Apply the changes:
    ```bash
    terraform apply -var-file=terraform.tfvars
    ```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloud_id | ID облака в Yandex Cloud | `string` | n/a | yes |
| folder_id | ID каталога в Yandex Cloud | `string` | n/a | yes |
| zone | Зона доступности по умолчанию | `string` | n/a | yes |
| student_id | Идентификатор студента | `string` | n/a | yes |
| ssh_auth_key_file | Путь к публичному SSH ключу | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vm_internal_ip | The internal IP address of the virtual machine |
| vm_external_ip | The external IP address of the virtual machine |