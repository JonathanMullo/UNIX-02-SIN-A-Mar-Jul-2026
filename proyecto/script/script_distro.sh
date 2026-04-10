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
# Create a temporary mount point directory for the boot image
mkdir m
# Mount the boot disk image into directory m to copy files inside
mount boot m
# Copy the kernel and initramfs into the mounted disk image
cp bzImage init.cpio m
# Unmount the disk image once the files have been copied
umount m
#Run virtual machine with kernel and initramfs
qemu-system-x86_64 -nographic -append "console=ttyS0" \
 -kernel bzImage -initrd init.cpio -drive file=boot,format=raw

#Solution to init error
# Enter the initial filesystem directory that the kernel will load into memory
cd /boot-files/initramfs
# Remove the linuxrc file that BusyBox creates automatically (we don't need it)
rm -f linuxrc
# Grant execution permissions to the init script (required by the kernel to run it)
chmod +x init
# Package all initramfs content into cpio format that the kernel understands
find . | cpio -o -H newc > /boot-files/init.cpio
# Verify that the init file was correctly included inside the cpio package
cpio -it < /boot-files/init.cpio | grep init
# Go back to the initramfs directory to continue working
cd /boot-files/initramfs
# Regenerate the updated initramfs with the correct BusyBox content
find . | cpio -o -H newc > /boot-files/init.cpio
# Count how many files the initramfs contains to verify BusyBox is included
cpio -it < /boot-files/init.cpio | wc -l
# Visually verify that bin/, sbin/, usr/ folders and init file exist
ls /boot-files/initramfs/
# Search for the compiled BusyBox binary inside the workspace
ls /workspaces/*/busybox/busybox 2>/dev/null || find /workspaces -name "busybox" -type f 2>/dev/null
# Enter the directory where BusyBox was compiled
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/busybox
# Install BusyBox into the initramfs creating bin/, sbin/, usr/ with all Unix commands
make CONFIG_PREFIX=/boot-files/initramfs install
# Disable CONFIG_TC in the configuration to fix a compilation error
sed -i 's/CONFIG_TC=y/CONFIG_TC=n/' .config
# Compile BusyBox using 2 processor cores for faster build
make -j2
# Install BusyBox correctly into the initramfs after fixing the error
make CONFIG_PREFIX=/boot-files/initramfs install
# Confirm the installation was successful by listing the created folders
ls /boot-files/initramfs/
# Enter the initramfs directory to prepare the final packaging
cd /boot-files/initramfs
# Remove linuxrc again so the kernel uses our custom init script
rm -f linuxrc
# Generate the final initramfs with complete BusyBox and init script
find . | cpio -o -H newc > /boot-files/init.cpio
# Go back to the main directory where all boot files are located
cd /boot-files
# Boot the virtual machine with QEMU in terminal mode using the kernel and initramfs
qemu-system-x86_64 -nographic -append "console=ttyS0" \
  -kernel bzImage -initrd init.cpio -drive file=boot,format=raw