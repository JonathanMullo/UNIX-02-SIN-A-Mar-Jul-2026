# List the files and directories in the current directory
ls
# List the files specifically inside the "Documents" folder
ls Documents
# Run an Easter egg (hidden joke) in the terminal using the aptitude package manager
aptitude moo
# List directory contents in long format (shows permissions, owner, size, and date)
ls -l
# List in long format and reverse order
ls -l -r                                                         
# List in long format and reverse order (using combined flags)
ls -rl                                                                
# Easter egg with one level of verbosity
aptitude -v moo
# Easter egg with two levels of verbosity
aptitude -vv moo 
# Easter egg with three levels of verbosity
aptitude -vvv moo
# Easter egg with two levels of verbosity (separated options)
aptitude -v -v moo
# Print the current working directory path (syntax example with options)
pwd [OPCIONES]
# Change to the "Documents" directory
cd Documents
# Change to the root directory
cd /                                                                
# Change to the absolute path of the sysadmin user directory
cd /home/sysadmin                                                        
# Print the current working directory
pwd                                                                                                                                
# Change to the relative path "School/Art"
cd School/Art                                                                                                                      
# Move up one level in the directory tree (go to parent folder)
cd ..                                                                   
# Change to the current user's home directory
cd ~                                                                                                                                            
# List the contents of the /var/log/ directory in long format
ls -l /var/log/ 
# List /var/log in long format, sorted by modification time (newest first)
ls -lt /var/log                                                                                                                              
# List /var/log in long format, sorted by file size (largest first)
ls -l -S /var/log 
# List /var/log in long format, sorted by size in reverse order (smallest first)
ls -lSr /var/log
# List the contents of /var/log in reverse order
ls -r /var/log                                                           
# Switch to the root user (superuser) and start a login shell
su -                                                                     
# Run the Steam Locomotive animation (if the 'sl' package is installed)
sl                                                                       
# Run the Steam Locomotive animation with superuser privileges
sudo sl
# Change to the "Documents" directory inside the user's home directory
cd ~/Documents                                                          
# Show long format details for the specific file "hello.sh"
ls -l hello.sh                                                     
# Execute the "hello.sh" script located in the current directory
./hello.sh                                                               
# Grant execution permission to the user owner of the "hello.sh" file
chmod u+x hello.sh                                                       
# Verify the permissions of "hello.sh" after the change
ls -l hello.sh                                                           
# Execute the "hello.sh" script again (it should work now)
./hello.sh                                                               
# List all contents of the current directory in long format
ls -l                                                                    
# Change the owner of the "hello.sh" file to "root" using administrator privileges
sudo chown root hello.sh                                                 
# Verify that the owner of "hello.sh" has changed
ls -l hello.sh                                                           
# Display the entire contents of the "animal.txt" file on the screen
cat animal.txt                                                           
# Display the entire contents of the "animals.txt" file on the screen
cat animals.txt                                                          
# Display the entire contents of the "alpha.txt" file on the screen
cat alpha.txt                                                            
# Output the first 10 lines (by default) of the "alpha.txt" file
head alpha.txt    
# Output the last 10 lines (by default) of the "alpha.txt" file
tail alpha.txt                                                           
# Output specifically the first 5 lines of the "alpha.txt" file
head -n 5 alpha.txt                                                      
# Output specifically the last 5 lines of the "alpha.txt" file
tail -n 5 alpha.txt                                                      
# Copy the /etc/passwd file to the current directory (represented by the dot)
cp /etc/passwd .                                                         
# List the directory to verify the file was copied
ls                                                                       
# Return to the home directory
cd ~                                                                     
# Create a 50MB file filled with zeros named "swapex" in the /tmp folder
dd if=/dev/zero of=/tmp/swapex bs=1M count=50                         
                               
