

output "servers" {
value = libvirt_domain.server.*.name
}

output "ips" {
value = libvirt_domain.server.*.network_interface.0.addresses
}

