# 1GB = 1073741824
# centos6/7srv minimum  8589934592 8589934592
# ubuntu16 minimum      2361393152
# ubuntu 18 min  

variable "instance_data"   {
    description = "Please adjust the following variables to refect servers parameters "
    type = map(string)
    default = {
    "os-image"      = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
        #centos6srv    = "https://cloud.centos.org/centos/6/images/CentOS-6-x86_64-GenericCloud.qcow2"
        #centos7srv    = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
        #centos8srv    = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2"
        #ubuntu14srv   = "https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img"
        #ubuntu16srv   = "https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img"
        #ubuntu18srv   = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
        #ubuntu20srv   = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
        #ubuntu21srv   = "https://cloud-images.ubuntu.com/hirsute/current/hirsute-server-cloudimg-amd64-disk-kvm.img"
    "count"         = "1"
    "vcpu"          = "1"
    "size"          = "53687091200" #50GB
    "memory"        = "4096"
    "network"       = "enp4s0"
    # namespace project-customer-environment-hostname.hostname_prefif
    "project"       = "myproject"
    "customer"      = "mycustomer"
    "environment"   = "development"
    "hostname"      = "k8s-master"
    "packages"      = "[qemu-guest-agent, vim, curl, wget,apt-transport-https, ca-certificates, software-properties-common ]"
    "version"       = "1.0"
    "hostname_prefix" = "mylan.lan"
    "wait_4_lease"  = "false"
    "pool"          = "default" # where disk stored
    "user"          = "forrayz"
    "gecos"         = "forrayz@hotmail.com"
    "groups"        = "sudo"
    "public_key"    = ""
  }
}

#DataBase Server

