# Problema 1
mv docs registros
mkdir plantillas
git add .
git commit -m "Fix problem 1: directory structure corrected"

# Problema 2
mv sensores.log registros/
mv ajustes.old ajustes.conf
git add .
git commit -m "Fix problem 2: files moved and renamed"

# Problema 3
chmod 600 registros/sensores.log
git add .
git commit -m "Fix problem 3: numeric permissions 600 set"