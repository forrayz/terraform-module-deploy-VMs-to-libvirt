#!/bin/bash
trap "set +x; sleep 1; set -x" DEBUG
set -e
TARGET_DIR=../images/
mkdir -p $TARGET_DIR
wget --continue --no-clobber --directory-prefix $TARGET_DIR https://cloud.centos.org/centos/6/images/CentOS-6-x86_64-GenericCloud.qcow2
wget --continue --no-clobber --directory-prefix $TARGET_DIR https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2
wget --continue --no-clobber --directory-prefix $TARGET_DIR https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2
wget --continue --no-clobber --directory-prefix $TARGET_DIR https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img
wget --continue --no-clobber --directory-prefix $TARGET_DIR https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img
wget --continue --no-clobber --directory-prefix $TARGET_DIR https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img
wget --continue --no-clobber --directory-prefix $TARGET_DIR https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img
wget --continue --no-clobber --directory-prefix $TARGET_DIR https://cloud-images.ubuntu.com/hirsute/current/hirsute-server-cloudimg-amd64-disk-kvm.img
