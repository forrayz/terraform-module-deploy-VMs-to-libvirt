terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
     uri = "qemu+ssh://forrayz@192.168.1.36/system"
 }