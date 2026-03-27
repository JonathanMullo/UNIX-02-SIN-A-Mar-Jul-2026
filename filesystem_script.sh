# change directory to /dev directory
cd /dev
#list files and directories on the /dev directory
ls
#Show the history of the used commands 
history
# change directory to /proc directory
cd /proc
# Displays file content on screen
cat cpuinfo
# Compile the file in C using GCC and generate an executable called greetingbin.
gcc saludo.c -o saludobin
# Move the executable to /bin/ using administrator permissions (sudo) so that the system can run it from anywhere.
sudo mv saludobin /bin/
# Change to the /etc directory,where system configuration files are located
cd /etc
# Enter the gss/ folder within the current directory
cd gss/
# Run the compiled program from the terminal
saludobin
# Shows the path of the current directory
pwd