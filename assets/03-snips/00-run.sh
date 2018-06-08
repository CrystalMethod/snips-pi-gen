#!/bin/bash -e

install -m 644 files/snips.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
on_chroot apt-key add - < files/snips.gpg.key
on_chroot << EOF
pip install virtualenv
apt-get update
EOF

install -m 644 files/hotspot.txt "${ROOTFS_DIR}/boot/"
install -m 644 files/interfaces "${ROOTFS_DIR}/etc/network/"
install -m 644 files/hostapd "${ROOTFS_DIR}/etc/default/"
install -m 644 files/hostapd.conf "${ROOTFS_DIR}/etc/hostapd/"
install -m 644 files/snips-access-point.conf "${ROOTFS_DIR}/etc/dnsmasq.d/" 
install -m 644 files/snips-access-point.service "${ROOTFS_DIR}/etc/systemd/system/"
install -m 755 files/snips-access-point "${ROOTFS_DIR}/usr/bin"
on_chroot << EOF
echo "10.99.99.1      snips" | sudo tee --append /etc/hosts
systemctl enable snips-access-point.service
EOF
