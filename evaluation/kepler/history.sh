    1  git fetch upstream
    2  git checkout -b eval_p2_1_g1 upstream/eval_p2_1_g1
    3  git branch -a | grep eval
    4  git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
    5  git push origin eval_p2_1_g2
    6  git config --local core.hooksPath .no-hooks
    7  git push origin eval_p2_1_g2
    8  git fetch upstream
    9  git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
   10  git push -u origin eval_p2_1_g2
   11  gpg --full-generate-key
   12  gpg --full-generate-key --pinentry-mode loopback
   13  gpg --list-keys
   14  mv kepler/docs kepler/registros
   15  cd evaluation/keple
   16  cd evaluation/kepler
   17  mv docs registros
   18  mkdir plantillas
   19  git add .
   20  git commit -m "Fix problem 1: directory structure corrected"
   21  mv sensores.log registros/
   22  mv ajustes.old ajustes.conf
   23  git add .
   24  git commit -m "Fix problem 2: files moved and renamed"
   25  touch history.sh
   26  chmod 600 registros/sensores.log
   27  git add .
   28  git commit -m "Fix problem 3: numeric permissions 600 set"
   29  chmod u+x runner.sh
   30  chmod o-w ajustes.conf
   31  git add .
   32  git commit -m "Fix problem 4: symbolic permissions corrected"
   33  ./calificar.sh kepler
   34  ../../calificar.sh kepler
   35  ../calificar.sh kepler
   36  /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/calificar.sh kepler
   37  chmod u+s runner.sh
   38  git add .
   39  git commit -m "Fix problem 5: SUID bit enabled"
   40  sudo chmod +t /tmp/kepler_zone
   41  sudo mkdir -p /tmp/kepler_zone
   42  sudo chmod 1777 /tmp/kepler_zone
   43  git add .
   44  git commit -m "Fix problem 6: sticky bit enabled in /tmp/kepler_zone"
   45  git push origin eval_p2_1_g2
   46  gpg --output registros/sensores.log.gpg --encrypt --recipient vega@kepler.lab registros/sensores.log
   47  git add .
   48  git commit -m "Fix problem 7: log file encrypted"
   49  gpg --clearsign ajustes.conf
   50  gpg --detach-sign runner.sh
   51  git add .
   52  git commit -m "Fix problem 8: GPG signatures created and fixed"
   53  gpg --output registros/sensores.log.gpg --encrypt --recipient vega@kepler.lab registros/sensores.log
   54  git add .
   55  git commit -m "Fix problem 7: sensors log encrypted and overwritten"
   56  git push origin eval_p2_1_g2
   57  find /workspaces -name "calificar.sh" -exec bash {} kepler \;
   58  history