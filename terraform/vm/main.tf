resource "yandex_compute_instance" "OreolHA" {
  name        = "oreol-haproxy"
  platform_id = "standard-v3" # Ice Lake
  zone        = var.zone

  resources {
    cores         = 2
    core_fraction = 50
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2204_lts.id
      size     = 30
      type     = "network-hdd"
    }
  }
  network_interface {
    subnet_id          = data.yandex_vpc_subnet.oreol-ru-central1-b.id
    nat                = true
    nat_ip_address     = yandex_vpc_address.ext_addr.external_ipv4_address[0].address
    security_group_ids = [data.yandex_vpc_security_group.ha-proxy-sg.id]
  }

  metadata = {
    user-data = data.template_file.instance_userdata.rendered
  }
}

output "externetl_ip" {
  value = yandex_vpc_address.ext_addr.external_ipv4_address[0].address
}

resource "yandex_vpc_address" "ext_addr" {
  name = "Oreol-HaProxy-adress"
  external_ipv4_address {
    zone_id = var.zone
  }
}