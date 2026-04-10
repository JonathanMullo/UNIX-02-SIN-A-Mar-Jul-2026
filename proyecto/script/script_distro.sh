#Update system package list
1._ Sudo apt update
#Install required tools to compile the kernel
2._ sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86
#Clone the Linux kernel repository
3._ git clone --depth 1 https://github.com/torvalds/linux.git 
#Enter the source code directory
4._ cd linux
#Configure kernel options
5._ make menuconfig
#Compile the kernel using 2 CPU core
6._ make -j 2


