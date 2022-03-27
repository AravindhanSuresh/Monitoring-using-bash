#!/bin/bash
cpuuse=`sar -P ALL 1 2 |grep 'Average.*all' |awk -F" " '{print 100.0 -$NF}'`
if [ "$cpuuse" -ge 80 ]; then
SUBJECT="ATTENTION: CPU load is high on $(hostname) at $(date)"
MESSAGE="/tmp/Mail.out"
TO="s.aravidhan48@gmail.com"
  echo "CPU current usage is: $cpuuse%" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "Top 5 Processes which consuming high CPU" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "$(ps -eo pcpu,pid,user,args | sort -k 1 -r | head -6)" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm /tmp/Mail.out
  fi


# ------------------------------------------------------------------------
  # <!-- echo "+------------------------------------------------------------------+" >> $MESSAGE -->
  # <!-- echo "Top 20 processes which consuming high CPU" >> $MESSAGE -->
  # <!-- echo "+------------------------------------------------------------------+" >> $MESSAGE -->
  # <!-- echo "$(top -bn1 | head -20)" >> $MESSAGE -->
  # <!-- echo "" >> $MESSAGE -->