on_chroot << EOF
usermod -a -G snips-skills-admin pi
systemctl disable snips-asr-google
systemctl disable snips-asr-injection
EOF
