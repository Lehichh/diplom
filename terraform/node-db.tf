resource "yandex_compute_instance" "database" {
  count = 2
  name                      = "database-${count.index}"
  zone                      = "ru-central1-a"
  hostname                  = "database-${count.index}"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.image.id
      type        = "network-nvme"
      size        = "15"
    }

  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    nat       = true
    ip_address = "192.168.15.20${count.index}"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

