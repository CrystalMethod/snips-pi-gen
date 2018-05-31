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
> I have successfully used an AWS EC2 instance with Ubuntu 16.04 to generate the Raspbian image using this method.

<!-- -->

    git clone https://github.com/RichardBronosky/pi-gen-extender.git
    cd pi-gen-extender
    source provision.sh
    provision
    sudo ./build.sh


### with Vagrant:

#### Note:
> I have had problems doing this on macOS Sierra, but I'm including how it's intended to work here until I better understand the issue. It could be just my computer, or could be the OS. I've yet to try it on Linux or Windows.

<!-- -->

    git clone https://github.com/RichardBronosky/pi-gen-extender.git
    cd pi-gen-extender
    vagrant up
    vagrant ssh
    cd pi-gen
    sudo ./build.sh

## References

https://github.com/RichardBronosky/pi-gen-extender
https://github.com/RPi-Distro/pi-gen


[1]: https://github.com/CrystalMethod/snips-pi-gen/tree/master/03-snips
