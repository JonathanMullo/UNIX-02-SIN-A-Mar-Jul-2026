# Change directory to root directory
cd /
# Lists files and directories with a symbol at the end indicating their type
ls -F
# Update the package list
sudo apt update
# Update system packages
sudo apt upgrade
# Install the latest versions
sudo apt install parted
# Shows information about partitions and file systems
sudo parted -l && echo -e "\n--\n" && lsblk -f && echo -e "\n--\n"
# List all disks and their partitions
sudo parted -l
# Shows disks and partitions in a tree
lsblk -f
# (AND) execute the following command if the previous one is true
&&
# Prints a separator with line breaks
echo -e "\n---\n" 
# Check if the system uses UEFI or BIOS by checking if the folder exists
[-d /sys/firmware/efi] && echo "UEFI" || echo "BIOS"
# Start or close a test
[]
# Check if the directory exists
-d
# (OR) execute next if previous fails
||
