
resource "libvirt_volume" "instance_data-disk" {
  
  name           = "${var.instance_data["project"]}-${var.instance_data["customer"]}-${var.instance_data["environment"]}-${var.instance_data["hostname"]}-${format("%02d", count.index+1)}.${var.instance_data["hostname_prefix"]}.qcow2" 
  base_volume_id = "${libvirt_volume.os_volume.id}"
  pool           = "${var.instance_data["pool"]}"
  size           = "${var.instance_data["size"]}"
  count          = "${var.instance_data["count"]}"
}

resource "libvirt_volume" "os_volume" {
  name   = "${var.instance_data["project"]}-${var.instance_data["customer"]}-${var.instance_data["environment"]}-${var.instance_data["hostname"]}.${var.instance_data["hostname_prefix"]}-MasterVolume.qcow2"
    pool   = "default"
  #source = "http://192.168.254.1/cloud-images/bionic-server-cloudimg-amd64.img"
  source = "${var.instance_data["os-image"]}"
  }


