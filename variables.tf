# 1GB = 1073741824
# centos6/7srv minimum  8589934592 8589934592
# ubuntu16 minimum      2361393152
# ubuntu 18 min  
variable "network_address_ranges" {
  type    = list(string)
  default = ["10.17.3.0/24", "2001:db8:ca2:2::1/64"]
}
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
    # network configuration
    "network_name"   = "kube_network"
    "dns_enabled"    = "true"
    "dns_local_only" = "true"
    # (Optional, default false)
    # true: DNS requests under this domain will only be resolved by the
    # virtual network's own DNS server
    # false: Unresolved requests will be forwarded to the host's
    # upstream DNS server if the virtual network's DNS server does not
    # have an answer.
    # namespace project-customer-environment-hostname.hostname_prefif
    "network_mode"  = "nat" # mode can be: "nat" (default), "none", "route", "bridge"
    
    "wait_4_lease"  = "false"
    # namespace
    "project"       = "myproject"
    "customer"      = "mycustomer"
    "environment"   = "development"
    "hostname"      = "please-specify-hostname"

    "packages"      = "[qemu-guest-agent, vim, curl, wget,apt-transport-https, ca-certificates, software-properties-common ]"
    "version"       = "1.0"
    "hostname_prefix" = "mylan.lan"
    "pool"          = "default" # where disk stored
    "user"          = "forrayz"
    "gecos"         = "forrayz@hotmail.com"
    "groups"        = "sudo"
    "public_key"    = ""
  }
}

#DataBase Server

