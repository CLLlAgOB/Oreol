# vpc.tf
# VPC
resource "yandex_vpc_network" "oreol-vpc" {
  name = "Oreol-vpc"
}

# Public Subnet 
resource "yandex_vpc_subnet" "oreol-ru-central1-b" {
  name           = "int-subnet-b"
  zone           = var.zone
  network_id     = yandex_vpc_network.oreol-vpc.id
  v4_cidr_blocks = ["10.138.0.0/24"]
}

