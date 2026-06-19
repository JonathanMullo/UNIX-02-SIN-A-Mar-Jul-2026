#!/usr/bin/env bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt
#ps
ps | grep TTY
ps | grep -i tty
# -v
grep -v "35.237.4.214" log.txt
# -o
grep -o "35.237.4.214" log.txt
#awk
awk '{print $1}' log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt

awk '{print $1,$NF}' log.txt

touch example_csv.txt
echo "hola1,chao1" > example_csv.txt
echo "hola2,chao2" >> example_csv.txt
echo "hola3,chao3" >> example_csv.txt

awk -F',' '{print $1}' example_csv.txt

head -n 10 log.txt
awk 'NR < 10' log.txt

grep "42.236.10.117" log.txt 
awk '{print $7}' log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/Mozilla/Godzilla/g' log.txt
grep "Mozilla" log.txt
grep "Godzilla" log.txt
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
grep "Godzilla" newlog.txt

sed '1d' newlog.txt
sed -i '1d' newlog.txt
diff log.txt newlog.txt # Compare the original and modified log files
sed '$d' newlog.txt
sed -i '$d' newlog.txt 
tail -n 1 newlog.txt # Show the last line of the modified log file
sed 's/ //g' newlog.txt > newlog1.txt
cat newlog1.txt
sed '5,7d' newlog1.txt

sed -n '10,15p' log.txt

sleep 100 &
jobs
fg %
bg %1