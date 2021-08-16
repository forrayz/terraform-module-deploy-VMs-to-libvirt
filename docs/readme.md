# terraform module deploy VMs to Libvirt

## Setup hypervisor Install libvirt/kvm Ubuntu 20 disable apparmor and reboot machine

```bash
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager virt-viewer -y# installs packages
sudo usermod -a -G libvirt $(whoami)
```

## Install libvirt/kvm local hypervisor Fedora

```bash
#!/bin/bash
dnf install @virtualization
dnf -y group install --with-optional virtualization
systemctl start libvirtd ; systemctl enable libvirtd
sudo touch /etc/polkit-1/rules.d/80-libvirt-manage.rules
sudo usermod -a -G libvirt $USER;sudo  usermod -a -G kvm $USER
sudo useradd -G libvirt $USER ; sudo useradd -G libvirt-quemu $USER ; sudo useradd -G kvm $USER
sudo adduser $USER libvirt ; sudo adduser $USER libvirt-qemu ; sudo adduser $USER kvm # grants your user manage kvm/libvirt

cat <<EOF >> /etc/polkit-1/rules.d/80-libvirt-manage.rules
polkit.addRule(function(action, subject) {
  if (action.id == "org.libvirt.unix.manage" && subject.local && subject.active && subject.isInGroup("wheel")) {
      return polkit.Result.YES;
  }
});
EOF
```
## get images
execute script scripts/get-images.sh this wil drop images to images/ folder

## get etcdv3 up and avialable
I prefer etcdv3 as a backend however this is upon you. Having a central backend hadfull to keep state files out of the project and ensure no paralell deploys conflicts.

I am use docker-compose to get etcd3 up
```yaml
version: '2'

services:
  etcd:
    image: 'bitnami/etcd:latest'
    environment:
      - ALLOW_NONE_AUTHENTICATION=yes
      - ETCD_ADVERTISE_CLIENT_URLS=http://etcd:2379
    ports:
      - 2379:2379
      - 2380:2380
    
```

## Deploy your own stack
see examples folder

### caveats:
 - currently only Centos6/7/8 and Ubuntu 16/18/21 seems to work Ubuntu 20 (focal) fails to boot
### future plans:
 - add support to debian and slim OSs such as CoreOS