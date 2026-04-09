# Create a new folder called project
mkdir
#Lists the files and folders in the current directory
ls
#Enter the project folder using a relative path
cd proyecto /
# Enter (change the current directory) to the project folder
# Return to the previous directory
cd ..
# Move to that specific path (absolute directory)
cd //workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto
# Changes to the /home/codespace directory (absolute path)
cd /home/codespace/
# Goes to the user's home directory
cd ~
# Displays the path of the home directory
echo $HOME
# Displays the path of the bash executable
echo $BASH
# Displays the directories where the system searches for commands
echo $PATH
# Changes to the /usr/local directory
cd /usr/local
# Returns to the home directory using the HOME variable
cd $HOME
# Lists files with detailed info, including hidden files and inode numbers
ls -lai
# Lists files with long format, including hidden files and inode numbers (same as -lai)
ls -l -a -i
# Displays the manual/help page for the ls command
man ls
# Lists all files including hidden ones
ls --all
# List all files including hidden ones the difference is that the command is shorter
ls -a
# Changes the current directory to /bin
cd /bin
# Refers to the current directory 
.
# Refers to the parent directory 
..
# Total number of disk blocks used by the listed files
total 8
# Current directory with permissions, links, owner, group, size, and date
1572966 drwxrwxrwx+ 2 codespace codespace 4096 Apr  9 12:19 .
# Parent directory with permissions, links, owner, group, size, and date
1572874 drwxrwxrwx+ 5 codespace root 4096 Apr  9 12:21 ..
# Show detailed information about a file or directory
stat.
# Identifies the device (disk) where the file or directory is stored
Device: 7,4