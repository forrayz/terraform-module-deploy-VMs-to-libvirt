module k8s-master {
 source = "../../"
 instance_data       = var.k8s-master 
 }

# 1GB = 1073741824
# centos6/7srv minimum  8589934592 8589934592
# ubuntu16 minimum      2361393152
# ubuntu 18 min         2361393152 





variable "k8s-master"   {
    description = "Please adjust the following variables to refect  servers parameters "
    type = map(string)
    default = {
    # this determine what OS wil be installed
    "os-image"      = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
        #centos6srv    = "https://cloud.centos.org/centos/6/images/CentOS-6-x86_64-GenericCloud.qcow2"
        #centos7srv    = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
        #centos8srv    = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2"
        #ubuntu14srv   = "https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img"
        #ubuntu16srv   = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img"
        #ubuntu18srv   = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
        #ubuntu20srv   = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
        #ubuntu21srv   = "https://cloud-images.ubuntu.com/hirsute/current/hirsute-server-cloudimg-amd64-disk-kvm.img"
    "count"             = "1"
    "vcpu"              = "1"
    "size"              = "53687091200" #50GB
    "memory"            = "4096"
    "network"           = "enp4s0"
    # namespace project-customer-environment-hostname.hostname_prefif
    "project"           = "myproject"
    "customer"          = "mycustomer"
    "environment"       = "development"
    "pool"              = "default"
    "hostname"          = "k8s-master"
    "hostname_prefix"   = "mylan.lan"
    "packages"          = "[qemu-guest-agent, vim, curl, wget,apt-transport-https, ca-certificates, software-properties-common ]"
    "version"           = "1.0"
    "wait_4_lease"      = "false"
    # user data
    "user"              = "forrayz"
    "gecos"             = "forrayz@hotmail.com"
    "groups"            = "sudo"
    "public_key"        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQpI1DUwekKZ6N3PNKovzHxPn/1J1Ic8VJ2+jyACWvCk5K3fr7xNrUKxGFP75X0/IdD6FgGrASQT+WYlaNnVc8H6erKGTpgj6FQWraNVjLVmldf8aT7HIDLQMTwJh/kqsH+sKEBAA4FUj3FwUTxKVPVFLRZoYqX/Li4hL0mHdocrwHs5T0/YhA1ovie4CuMcib0lIYK8/xWNyGZpyM1kIDR3WzkgtnGBHf1j9VnbdRhrz7wZVJH1YKgG54YuS0tdmBCzW1EYJl2DhPlZr8cSnKJWxQWAidRSv7j0PVwsJu72THdCWgye4rU29ljUU9OtU7GVUDOUSGK+xrPydGvSB5 forrayz@forrayz-ThinkPad-P50"
  }
}


# outputs

output "k8s-master-servers" {
    value = "${module.k8s-master.servers}"
}
output "k8s-master-IP_Addresses" {
    value = "${module.k8s-master.ips}"
}
