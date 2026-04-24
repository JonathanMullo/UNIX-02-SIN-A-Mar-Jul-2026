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

# Problema 4
chmod u+x runner.sh
chmod o-w ajustes.conf
git add .
git commit -m "Fix problem 4: symbolic permissions corrected"

# Problema 5
chmod u+s runner.sh
git add .
git commit -m "Fix problem 5: SUID bit enabled"

# Problema 6
sudo mkdir -p /tmp/kepler_zone
sudo chmod 1777 /tmp/kepler_zone
git add .
git commit -m "Fix problem 6: sticky bit enabled in /tmp/kepler_zone"

# Problema 7
gpg --output registros/sensores.log.gpg --encrypt --recipient vega@kepler.lab registros/sensores.log
git add .
git commit -m "Fix problem 7: sensors log encrypted"

# Problema 8
gpg --clearsign ajustes.conf
gpg --detach-sign runner.sh
git add .
git commit -m "Fix problem 8: GPG signatures created and corrected"

# Finalización y entrega
git push origin eval_p2_1_g2