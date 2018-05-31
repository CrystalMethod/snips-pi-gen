#!/bin/bash -e

install -m 644 files/snips.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
on_chroot apt-key add - < files/snips.gpg.key
on_chroot << EOF
pip install virtualenv
apt-get update
EOF
