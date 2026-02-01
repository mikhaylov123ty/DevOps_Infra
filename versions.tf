terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"

  # Описание бэкенда хранения состояния
  backend "s3" {
    endpoints =  {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket     = "terraform-state-std-048-04"
    region     = "ru-central1"
    key        = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
  }
}