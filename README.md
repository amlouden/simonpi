
           __                                                                        __
      ____/\_\    ___ ___                      ___     ___                    _____ /\_\
     /',__\/\ \ /' __` __`\      _______      / __`\ /' _ `\      _______    /\ '__`\/\ \
    /\__, `\ \ \/\ \/\ \/\ \    /\______\    /\ \L\ \/\ \/\ \    /\______\   \ \ \L\ \ \ \
    \/\____/\ \_\ \_\ \_\ \_\   \/______/    \ \____/\ \_\ \_\   \/______/    \ \ ,__/\ \_\
     \/___/  \/_/\/_/\/_/\/_/                 \/___/  \/_/\/_/                 \ \ \/  \/_/
                                                                                \ \_\
                                                                                 \/_/
# Description
A quick & dirty script to emulate Raspberry family devices on your laptop.
It generates a valid sdcard image that could be deployed on real hardware and used as virtual storage for QEMU.

Powered with :heart: by Arch Linux Arm images


# Instructions
* ```git clone https://github.com/M0Rf30/simonpi.git```
* type 

```./simonpi -h for details```

You could transfer your sd img on a valid sdcard using this command:

```dd if=sd-arch-MODEL-qemu.img of=/dev/sdX```

where MODEL could be:
* rpi
* rpi-2
* rpi-3 (currently not working AArch64 emulation, use rpi-2 for ARMv7 32)

and X could be mmcblk0 or other block devices

## For Arch Linux users
You could find sim-on-pi on AUR
```yaourt -S simonpi-git```

# Common issues
This script uses dnsmasq dhcp server to assign ip to guests VM. Please, check your ports on local machine.

You could use: 
```ss -ntl``` 
to view conflicts between this script and other services running on port 53.

Raspberry PI 3 currently not working with AArch64. Use rpi-2 for rpi-3: it will work with a 32bit kernel image

# PR
* Fork it 
* Modify it
* TEST it
* Do a Pull Request

Any suggestions are welcome

# Used Kernels
Take a look here for adopted Kernel images:

https://github.com/M0Rf30/qemu-kernels-rpi-arch-arm
