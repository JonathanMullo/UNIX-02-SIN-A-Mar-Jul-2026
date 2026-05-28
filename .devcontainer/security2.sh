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
