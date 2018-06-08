on_chroot << EOF
usermod -a -G snips-skills-admin pi
systemctl stop snips-asr-google
systemctl disable snips-asr-google
systemctl stop snips-asr-injection
systemctl disable snips-asr-injection
EOF
