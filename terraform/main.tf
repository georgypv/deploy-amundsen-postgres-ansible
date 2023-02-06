#### PRODIVER INFO #####
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token       = var.yc_token
  cloud_id    = var.yc_cloud_id
  folder_id   = var.yc_folder_id
  zone        = var.yc_zone
  max_retries = 2
}


###############################
####### GET VMs ###############
###############################


## node-1
resource "yandex_compute_instance" "node-1" {

  name = "node-1"

  resources {
    core_fraction = 100
    cores         = 4
    memory        = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h059qvtg37ks9ke9o"
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.my-subnet-a.id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_cloud.pub")}"
  }
}



## node-2
resource "yandex_compute_instance" "node-2" {

  name = "node-2"

  resources {
    core_fraction = 100
    cores         = 2
    memory        = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h059qvtg37ks9ke9o"
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.my-subnet-a.id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yandex_cloud.pub")}"
  }
}


###############################
####### GET NETWORK ###########
###############################

resource "yandex_vpc_network" "my-network" {
  name = "my-network"
}

resource "yandex_vpc_subnet" "my-subnet-a" {
  name           = "my-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.my-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}