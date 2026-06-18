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