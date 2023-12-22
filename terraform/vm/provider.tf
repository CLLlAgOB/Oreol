#provider.tf
provider "yandex" {
  cloud_id                 = var.cloud_id
  service_account_key_file = var.sa_key_file
  folder_id                = var.folder_id
  zone                     = var.zone
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}