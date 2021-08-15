
resource "libvirt_domain" "server" {
  name   = "${var.instance_data["project"]}-${var.instance_data["customer"]}-${var.instance_data["environment"]}-${var.instance_data["hostname"]}-${format("%02d", count.index+1)}.${var.instance_data["hostname_prefix"]}"
  memory = "${var.instance_data["memory"]}"
  vcpu   = "${var.instance_data["vcpu"]}"
  count  = "${var.instance_data["count"]}"
  qemu_agent = true
  
  cloudinit = "${element(libvirt_cloudinit_disk.commoninit.*.id, count.index)}" 
  #cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    wait_for_lease = "${var.instance_data["wait_4_lease"]}"
      macvtap = "${var.instance_data["network"]}"
  }

# network_interface {
#     network_name     = "default"
#     wait_for_lease = true
#   }
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

disk {
    volume_id = "${element(libvirt_volume.instance_data-disk.*.id, count.index)}"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
