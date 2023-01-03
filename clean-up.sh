#!/bin/bash

pid=$(pgrep entr)
if [[ $pid != '' ]]; then
  echo "Process number ${pid} is about to be killed." 
  kill -9 $pid
else
  echo Not found the pid
fi
