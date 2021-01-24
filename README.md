# Caffe
**Read before proceed for the installation!**
Installation of Caffe on Ubuntu 16.04, without GPU support with OpenCV 3 installed.

***Acknowledgment***
- *All the caffe library on this git were **original source** from [BVLC/cafee](https://github.com/BVLC/caffe)*
- *The purpose of this git is to **ease the installation***
- *Please help the **original [BVLC/cafee](https://github.com/BVLC/caffe)** by **citing them** in your works*
- *Be responsible, Thanks!*

## Motivation
Installing Caffe is pretty straight forward as mentioned in [BVLC/cafee](https://github.com/BVLC/caffe).
However and somehow pretty painful and headache for me. So by gathering all the information from 
[Installing Caffe on Ubuntu 16.04](https://steemit.com/caffe/@aquib/installing-caffe-on-ubuntu-16-04), 
[This is a guide on how to install Caffe for Ubuntu 16.04 and above, without GPU support (No CUDA required)](https://gist.github.com/nikitametha/c54e1abecff7ab53896270509da80215) and [problem.. /usr/bin/ld: cannot find -lopencv_imgcodecs #4942](https://github.com/BVLC/caffe/issues/4942), I am finally manage to install it succesfully! Yesszaa!

**Notes**
My machine setting:
1. Operating System
```
Distributor ID:	Ubuntu
Description:	Ubuntu 16.04.7 LTS
Release:	16.04
Codename:	xenial
```

2. Hardware:
```
cpu:                                                            
                       Intel(R) Core(TM) i7-3520M CPU @ 2.90GHz, 2180 MHz
                       Intel(R) Core(TM) i7-3520M CPU @ 2.90GHz, 2257 MHz
                       Intel(R) Core(TM) i7-3520M CPU @ 2.90GHz, 2933 MHz
                       Intel(R) Core(TM) i7-3520M CPU @ 2.90GHz, 2250 MHz
keyboard:
                       Apple Internal Keyboard/Trackpad (ANSI)
mouse:
  /dev/input/mice      Apple Internal Keyboard/Trackpad (ANSI)
monitor:
                       Apple LCD Monitor
graphics card:
                       Intel 3rd Gen Core processor Graphics Controller
camera:
                       Apple iPhone5/5C/5S/6
sound:
                       Intel 7 Series/C210 Series Chipset Family High Definition Audio Controller
storage:
                       Intel 7 Series Chipset Family 6-port SATA Controller [AHCI mode]
network:
  wlp2s0               Broadcom BCM4331 802.11a/b/g/n
  enp1s0f0             Broadcom NetXtreme BCM57765 Gigabit Ethernet PCIe
  /dev/input/event12   OSA Express Network card
network interface:
  enp0s20u2c4i2        Ethernet network interface
  wlp2s0               Ethernet network interface
  lo                   Loopback network interface
  enp1s0f0             Ethernet network interface
disk:
  /dev/sdb             Samsung SSD 850
  /dev/sdc             SanDisk Extreme SSD
  /dev/sda             Samsung SSD 850
                       SanDisk Extreme SSD
partition:
  /dev/sdb1            Partition
  /dev/sdb2            Partition
  /dev/sdb3            Partition
  /dev/sdc1            Partition
  /dev/sdc2            Partition
  /dev/sdc3            Partition
  /dev/sda1            Partition
  /dev/sda2            Partition
  /dev/sda3            Partition
usb controller:
                       Intel 7 Series/C210 Series Chipset Family USB Enhanced Host Controller #2
                       Intel 7 Series/C210 Series Chipset Family USB Enhanced Host Controller #1
                       Intel 7 Series/C210 Series Chipset Family USB xHCI Host Controller
bios:
                       BIOS
bridge:
                       Intel 7 Series/C210 Series Chipset Family PCI Express Root Port 1
                       Intel HM77 Express Chipset LPC Controller
                       Intel Xeon E3-1200 v2/3rd Gen Core processor PCI Express Root Port
                       Intel PCI bridge
                       Intel 3rd Gen Core processor DRAM Controller
                       Intel PCI bridge
                       Intel 7 Series/C210 Series Chipset Family PCI Express Root Port 2
                       Intel PCI bridge
                       Intel PCI bridge
                       Intel PCI bridge
                       Intel PCI bridge
                       Intel 7 Series/C210 Series Chipset Family PCI Express Root Port 3
hub:
                       Intel Integrated Rate Matching Hub
                       Linux Foundation 2.0 root hub
                       Broadcom BCM2046B1 USB 2.0 Hub (part of BCM2046 Bluetooth)
                       Linux Foundation 3.0 root hub
                       Linux Foundation 2.0 root hub
                       Standard Microsystems 2.0 Hub
                       Intel Integrated Rate Matching Hub
                       Linux Foundation 2.0 root hub
memory:
                       Main Memory
firewire controller:
                       LSI FW643 [TrueFire] PCIe 1394b Controller
unknown:
                       FPU
                       DMA controller
                       PIC
                       Keyboard controller
                       Intel 7 Series/C210 Series Chipset Family MEI Controller #1
                       Intel 7 Series/C210 Series Chipset Family SMBus Controller
                       Intel System peripheral
                       Broadcom BCM57765/57785 SDXC/MMC Card Reader
                       Apple Bluetooth USB Host Controller
                       Apple iPhone5/5C/5S/6
                       Apple FaceTime HD Camera
                       Apple Internal Keyboard/Trackpad (ANSI)
                       Apple Built-in IR Receiver
```

## Changes has been made
1. Uncomment CPU_ONLY := 1 in Makefile.config
```
# CPU-only switch (uncomment to build without GPU support).
CPU_ONLY := 1
```

2. Uncomment OPENCV_VERSION := 3 as I am using OpenCV 3 in Makefile.config
```
# Whatever else you find you need goes here.
INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include  /usr/include/hdf5/serial 
LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib  /usr/lib/x86_64-linux-gnu/hdf5/serial
```

3. Comment opencv_imgcodecs in Makefile (not Makefile.config)
```
ifeq ($(USE_OPENCV), 1)
	LIBRARIES += opencv_core opencv_highgui opencv_imgproc

#	ifeq ($(OPENCV_VERSION), 3)
#		LIBRARIES += opencv_imgcodecs
#	endif

endif
```

### Installation
**Tested on Ubuntu 16.04**

```
$ git clone https://github.com/KhairulIzwan/caffe.git
$ cd caffe
$ ./installCaffe.sh

```
