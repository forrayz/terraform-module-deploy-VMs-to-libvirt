data "terraform_remote_state" "infrastructure" {
     backend = "etcdv3"
     config = {
         endpoints = ["192.168.1.24:2379"]
         prefix    = "terraform-state/${var.k8s-master["project"]}/${var.k8s-master["customer"]}/${var.k8s-master["environment"]}/${var.k8s-master["hostname_prefix"]}"
         lock      = true
     }
 }