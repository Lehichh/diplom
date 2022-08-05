resource "local_file" "inventory" {
  content = <<-DOC

    [nginx]
    sarkisyanweb ansible_host=${yandex_compute_instance.sarkisyanweb.network_interface.0.nat_ip_address}

    [db]
    database-0 ansible_host=${yandex_compute_instance.database[0].network_interface.0.nat_ip_address}
    database-1 ansible_host=${yandex_compute_instance.database[1].network_interface.0.nat_ip_address}

    [wp]
    app.sarkisyanweb.ru ansible_host=${yandex_compute_instance.wordpress.network_interface.0.nat_ip_address}

    [gitlab]
    gitlab.sarkisyanweb.ru ansible_host=${yandex_compute_instance.gitlab-ce.network_interface.0.nat_ip_address}
    runner.sarkisyanweb.ru ansible_host=${yandex_compute_instance.gitlab-runner.network_interface.0.nat_ip_address}

    [monitoring]
    monitoring.sarkisyanweb.ru ansible_host=${yandex_compute_instance.monitoring.network_interface.0.nat_ip_address}


    DOC
  filename = "../ansible/inventory.yml"

  depends_on = [
    yandex_compute_instance.sarkisyanweb,
    yandex_compute_instance.database[0],
    yandex_compute_instance.database[1],
    yandex_compute_instance.wordpress,
    yandex_compute_instance.gitlab-ce,
    yandex_compute_instance.gitlab-runner,
    yandex_compute_instance.monitoring
  ]
}
