#data.tf 
data "template_file" "instance_userdata" {
  template = file("linux.tpl")
  vars = {
    env         = "perf"
    username    = var.username
    groupname   = var.groupname
    ssh_public  = file(var.public_key)
    username2   = var.username2
    ssh_public2 = file(var.public_key2)
    key         = var.key
  }
}

data "yandex_compute_image" "ubuntu_2204_lts" {
  family = "ubuntu-2204-lts-oslogin"
}

data "yandex_vpc_subnet" "oreol-ru-central1-b" {
  name = "int-subnet-b"
}

data "yandex_vpc_security_group" "ha-proxy-sg" {
  name = "HaProxy security group"
}