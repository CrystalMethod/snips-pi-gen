# snips-pi-gen
Fork of RichardBronosky/pi-gen-extender. Creates images for an minimalistic and Snips based private voice assistant.

## What does this do?

The provisioning script serves this purposes:

1. `git clone https://github.com/RPi-Distro/pi-gen.git` 
1. Remove stages 3, 4, & 5 to make a Raspbian-lite image
1. Create a `03-custom-installations` sub-stage under `stage2`
1. Copies the [03-snips][1] folder into the new subsection
1. Installs all necessary dependencies of Snips and the Snips platform itselfs

## Usage

### without Vagrant:

#### Note:

<!-- -->

    git clone https://github.com/CrystalMethod/snips-pi-gen.git
    cd snips-pi-gen
    source provision.sh
    provision
    sudo ./build.sh


### with Vagrant:

#### Note:

<!-- -->

    git clone https://github.com/CrystalMethod/snips-pi-gen.git
    cd snips-pi-gen
    vagrant up
    vagrant ssh
    cd pi-gen
    sudo ./build.sh

## References

https://github.com/RichardBronosky/pi-gen-extender   
https://github.com/RPi-Distro/pi-gen   

[1]: https://github.com/CrystalMethod/snips-pi-gen/tree/master/03-snips
