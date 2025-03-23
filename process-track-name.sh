#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <program_name>"
  exit 1
fi

PROGRAM_NAME=$1
OUTPUT_FILE="process_stats.log"

touch $OUTPUT_FILE

echo "DATE TIME %CPU %MEM CMD" >> $OUTPUT_FILE

while true; do
  PIDS=$(pgrep -x $PROGRAM_NAME | grep -v $$ | grep -v $(pgrep -x pgrep))

  if [ -n "$PIDS" ]; then
    # Get the first PID found
    PID=$(echo $PIDS | awk '{print $1}')
    echo "Found process $PROGRAM_NAME with PID $PID"

    # Track the found process
    while kill -0 $PID 2>/dev/null; do
      TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

      echo -n "$TIMESTAMP " >> $OUTPUT_FILE
      ps -p $PID -o %cpu,%mem,cmd --no-headers >> $OUTPUT_FILE

      sleep 0.1
    done

    echo "Process $PROGRAM_NAME with PID $PID has terminated"
    exit 0
  fi

  sleep 0.1
done
