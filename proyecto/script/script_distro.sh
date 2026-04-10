#Update system package list
Sudo apt update
#Install required tools to compile the kernel
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86
#Clone the Linux kernel repository
git clone --depth 1 https://github.com/torvalds/linux.git 
#Enter the source code directory
cd linux
#Configure kernel options
make menuconfig
#Compile the kernel using 2 CPU core
make -j 2
#Create directory to store boot files
sudo mkdir /boot-files
#Copy compiled kernel image to boot directory
sudo cp arch/x86/boot/bzImage /boot-files/
#Return to previous directory
cd ..
#Clone BusyBox repository
git clone --depth 1 https://git.busybox.net/busybox
#Enter BusyBox directory
cd busybox
#Configure BusyBox options
make menuconfig
#Compile BusyBox using 2 CPU cores
make -j 2
#Create initramfs directory structure
sudo mkdir /boot-files/initramfs
#Install BusyBox files into initramfs directory
sudo make CONFIG_PREFIX=/boot-files/initramfs install
#Navigate to initramfs directory
cd /boot-files/initramfs
#Create and edit init file (startup script)
sudo vi init
#Remove default linuxrc file to avoid conflicts
sudo rm linuxrc
#Give execution permissions to init script
sudo chmod +x init
#Create initramfs archive using cpio
sudo find . | cpio -o -H newc > ../init.cpio
#Return to previous directory
cd ..
#Switch to root user
sudo su
#Create a 50MB boot image file filled with zeros
dd if=/dev/zero of=boot bs=1M count=50
#Format the boot image with FAT filesystem
mkfs -t fat boot
#Install Syslinux bootloader on the image
syslinux boot
#Run virtual machine with kernel and initramfs
qemu-system-x86_64 -nographic -append "console=ttyS0" \
 -kernel bzImage -initrd init.cpio -drive file=boot,format=raw
