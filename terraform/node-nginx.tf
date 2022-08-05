data "yandex_compute_image" "image" {
  family = "ubuntu-2004-lts"
}


resource "yandex_compute_instance" "sarkisyanweb" {
  name                      = "sarkisyanweb"
  zone                      = "ru-central1-a"
  hostname                  = "sarkisyanweb"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.image.id
      name        = "root-node01"
      type        = "network-nvme"
      size        = "15"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
