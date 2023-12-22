
resource "yandex_vpc_security_group" "ha-proxy-sg" {
  name        = "HaProxy security group"
  description = "HaProxy security group"
  network_id  = yandex_vpc_network.oreol-vpc.id

  labels = {
    my-label = "my-label-value"
  }

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      protocol       = "TCP"
      description    = "Allow port from all"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = ingress.value
    }
  }

  ingress {
    protocol       = "TCP"
    description    = "Permit for stat"
    v4_cidr_blocks = var.allowed_stat_ip
    port           = var.allowed_statport
  }

  egress {
    protocol       = "ANY"
    description    = "Permit ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

}