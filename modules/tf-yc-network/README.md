# Yandex Cloud Network Module

This module provides information about existing Yandex Cloud VPC networks and subnets. It uses data sources to fetch information about the "default" network and its subnets across specified availability zones.

## Usage

```hcl
module "yandex_cloud_network" {
  source = "./modules/tf-yc-network"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| network_zones | Yandex.Cloud network availability zones | `set(string)` | `["ru-central1-a","ru-central1-b","ru-central1-d"]` | no |

## Outputs

| Name | Description |
|------|-------------|
| yandex_vpc_network | Yandex.Cloud Network info |
| yandex_vpc_subnets | Yandex.Cloud Subnets map |
