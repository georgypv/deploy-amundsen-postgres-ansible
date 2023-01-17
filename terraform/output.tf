

output "internal_ip_node1" {
  value = yandex_compute_instance.node-1.network_interface.0.ip_address
}

output "internal_ip_node2" {
  value = yandex_compute_instance.node-2.network_interface.0.ip_address
}


###########

output "external_ip_node1" {
  value = yandex_compute_instance.node-1.network_interface.0.nat_ip_address
}

output "external_ip_node2" {
  value = yandex_compute_instance.node-2.network_interface.0.nat_ip_address
}
