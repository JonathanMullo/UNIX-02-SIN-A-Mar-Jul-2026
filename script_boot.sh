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