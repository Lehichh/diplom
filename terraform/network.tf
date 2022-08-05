resource "yandex_vpc_network" "default" {
  name = "net"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name = "subnet-1"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.15.0/24"]
}


resource "yandex_vpc_subnet" "subnet-2" {
  name = "subnet-2"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.16.0/24"]
}

resource "yandex_dns_zone" "sarkisyan_dns_zone" {
  zone             = "sarkisyanweb.ru."
  public           = true
}

resource "yandex_dns_recordset" "sarkisyanweb" {
  zone_id = yandex_dns_zone.sarkisyan_dns_zone.id
  name    = "sarkisyanweb.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.sarkisyanweb.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "wordpress" {
  zone_id = yandex_dns_zone.sarkisyan_dns_zone.id
  name    = "www"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.sarkisyanweb.network_interface.0.nat_ip_address}"]
}


resource "yandex_dns_recordset" "gitlab" {
  zone_id = yandex_dns_zone.sarkisyan_dns_zone.id
  name    = "gitlab"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.sarkisyanweb.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "grafana" {
  zone_id = yandex_dns_zone.sarkisyan_dns_zone.id
  name    = "grafana"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.sarkisyanweb.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "prometheus" {
  zone_id = yandex_dns_zone.sarkisyan_dns_zone.id
  name    = "prometheus"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.sarkisyanweb.network_interface.0.nat_ip_address}"]
}

resource "yandex_dns_recordset" "alertmanager" {
  zone_id = yandex_dns_zone.sarkisyan_dns_zone.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.sarkisyanweb.network_interface.0.nat_ip_address}"]
}
