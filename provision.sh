#!/bin/bash

install_dependencies(){
	sudo apt-get update
	sudo apt-get install -y curl quilt parted realpath \
		qemu-user-static debootstrap zerofree pxz zip \
		dosfstools bsdtar libcap2-bin grep rsync xz-utils git
}

create_basic_configuration(){
	echo 'IMG_NAME=snips-raspbian' >> config
}

create_installation_customization_demo(){
	cp -aR $script_path/assets/03-snips $(pwd)/stage2
	files_path="$(pwd)/stage2/03-snips/files"
}

prepare_upstream_source(){
	git clone https://github.com/RPi-Distro/pi-gen.git
	cd pi-gen/
	rm -rf ./stage[345]
	create_basic_configuration
}

customize_user_environment(){
	(cat | tee -a ~/.bashrc | sudo tee -a ~root/.bashrc > /dev/null) <<EOF

export EDITOR=vim
set -o vi
alias ll='ls -la'
EOF
}

provision(){
	install_dependencies
	prepare_upstream_source
	create_installation_customization_demo

}

provision_vagrant(){
	provision
	customize_user_environment
}

is_being_sourced(){
	[[ "${BASH_SOURCE[0]}" != "${0}" ]]
}

script_path(){
	if is_being_sourced; then
		echo $(pwd)
	else
		cd $(dirname "$0")
		echo $(pwd)
		cd - > /dev/null
	fi
}

script_path=$(script_path)

if is_being_sourced; then
	echo "Script ${BASH_SOURCE[0]} is being sourced. Functions defined but not called."
	echo 'Try calling `provision`, and then './build.sh' in the pi-gen directory.'
else
	provision_vagrant
fi
