# View current parent group
id
# Parent group name only
id -gn
# Create a test file to verify inherited group permissions
touch ~/test_grupo_heredado.txt
# Display detailed information about the test file
ls -la ~/test_grupo_heredado.txt
# View the current group
id -gn
echo "Grupo actual:$(id -gn)"
# Create a file before newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt
# Install required system utilities for user/group management
apt install uidmap util-linux-extra
# Create a new group called "desarrolladores"
groupadd desarrolladores
# Change to the "developers"
newgrp desarrolladores
# Verify that the active group has changed
id -gn
echo "Nuevo grupo activo:$(id -gn)"
# Create a file inside the subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# The group is now 'developers'
# Create a directory
mkdir -p ~/proyecto_dev/src
ls -la ~/
# Project_dev/has group 'developers'
# Exit newgrp subshell
exit
# Verify that we returned to the original group
id -gn
echo "Grupo restaurado:$(id -gn)"
# Compare the two files
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt
# Create a group with a password
sudo groupadd grupo_restringido
sudo gpasswd grupo_restringido
# The system will prompt for a group password
#Un usuario que NO pertenece al grupo puede unirse temporalmente si conoce la contraseña
newgrp grupo_restringido
# The system will ask for the group password
# If the password is correct, you will be temporarily joined
id -gn
exit # Upon exiting, you will lose your temporary membership.

