terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-object-storage"
    region     = "ru-central1"
    key        = "terraform/terraform.tfstate"
//    access_key = <access_key>
//    secret_key = <secret_key>

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}



provider "yandex" {
  cloud_id                 = "b1gdf77vi5ve9v93ju6u"
  service_account_key_file = "./key.json"
  folder_id                = "b1g18ju5thr617j2dihl"
}

