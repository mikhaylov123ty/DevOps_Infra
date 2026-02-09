# Yandex Cloud Instance Module

This module creates a Yandex Cloud Compute Instance with configurable resources, boot disk, and network interface. It also supports cloud-init configuration via metadata.

## Usage

```hcl
module "yandex_cloud_vm_instance" {
  source            = "./modules/tf-yc-instance"
  zone              = "ru-central1-a"
  subnet_id         = "your-subnet-id"
  ssh_auth_key_file = "~/.ssh/id_rsa.pub"
  student_id        = "your-id"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vm_instance | Имя инстанса виртуальной машины | `string` | `"practice1"` | no |
| student_id | Идентификатор студента. Наследуется из корневого модуля | `string` | n/a | yes |
| zone | Идентификатор зоны. Наследуется из корневого модуля | `string` | n/a | yes |
| platform_id | Платформа ВМ | `string` | `"standard-v3"` | no |
| cpu_cores | Количество ядер процессора | `number` | `2` | no |
| memory | Количество оперативной памяти в ГБ | `number` | `2` | no |
| image_id | Образ операционной системы для новой виртуальной машины | `string` | `"fd80qm01ah03dkqb14lc"` | no |
| disk_size | Размер диска в ГБ | `number` | `30` | no |
| subnet_id | Идентификатор подсети, к которой будет подключена ВМ | `any` | n/a | yes |
| nat | Включить NAT для инстанса | `bool` | `true` | no |
| user_data_file | Путь к файлу скрипта cloud-init | `string` | `"./scripts/cloud-init.yaml"` | no |
| ssh_auth_key_file | Путь к файлу с публичным SSH ключом | `string` | n/a | yes |
| scheduling_policy | Политика прерывания ВМ | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| public_ip_address | The external IP address of the virtual machine |
| ip_address | The internal IP address of the virtual machine |
