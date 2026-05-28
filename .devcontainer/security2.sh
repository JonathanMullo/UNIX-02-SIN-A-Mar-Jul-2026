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