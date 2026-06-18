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