resource "libvirt_cloudinit_disk" "commoninit" {
  name = "${var.instance_data["project"]}-${var.instance_data["customer"]}-${var.instance_data["environment"]}-${var.instance_data["hostname"]}-${format("%02d", count.index+1)}.${var.instance_data["hostname_prefix"]}.cloud-init.iso"
  #name = "${var.instance_data["project"]}-${var.instance_data["customer"]}-${var.instance_data["environment"]}-${var.instance_data["hostname"]}.${var.instance_data["hostname_prefix"]}.cloud-init.iso"
  # plan = "${var.plans["5USD"]}"
  pool = "default"
  count = "${var.instance_data["count"]}"  
user_data = <<EOF
#cloud-config
hostname: ${var.instance_data["project"]}-${var.instance_data["customer"]}-${var.instance_data["environment"]}-${var.instance_data["hostname"]}-${format("%02d", count.index+1)}.${var.instance_data["hostname_prefix"]}
groups:
  - ubuntu: [root,sys]
  - cloud-users

# Add users to the system. Users are added after groups are added.
users:
  
  - name:           ${var.instance_data["user"]}
    gecos:          ${var.instance_data["gecos"]}
    groups:         ${var.instance_data["groups"]}
    ssh_import_id:  ${var.instance_data["public_key"]}
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ${var.instance_data["public_key"]}
    shell: /bin/bash

# growpart:
#   mode: auto
#   devices: ['/']


packages: ${var.instance_data["packages"]}

package_upgrade: true

power_state:
 delay: "+1"
 mode: reboot
 message: Rebooting to get IP
 timeout: 1
 condition: True
EOF
  
  
  #network_config = "${data.template_file.test-fw-network-config.rendered}"
  
}
#"${element(libvirt_cloudinit_disk.cloudinit_test-fw.*.id, count.index)}"

