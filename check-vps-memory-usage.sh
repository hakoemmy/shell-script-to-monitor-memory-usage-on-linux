#!/bin/bash
ramusage=$(free | awk '/Mem/{printf("RAM Usage: %.2f\n"), $3/$2*100}'| awk '{print $3}' | cut -d. -f1)

if [ $ramusage -ge 45 ]; then
SUBJECT="ATTENTION: Your VPS Memory Utilization is High on $(hostname) at $(date)"
MESSAGE="/tmp/Mail.out"
TO="youremail@mailserver.com"

  echo "VPS Memory Current Usage is: $ramusage%" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "Top Memory Consuming Processes Using top command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "$(top -b -o +%MEM | head -n 20)" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "Top Memory Consuming Processes Using ps command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "$(ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head)" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm /tmp/Mail.out
  fi