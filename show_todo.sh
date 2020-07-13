#!/bin/bash
# if [ ! -f "~/desktop/todo" ];then
  # $(touch ~/desktop/todo)
  # $(vim ~/desktop/todo)
  # echo "no"
# else
i=1
todo=$(awk 'BEGIN {RS="\n";ORS=" "} {print}' ~/desktop/todo)
while [ $i -lt 30 ]
do
  i=$((i+1))
  xsetroot -name "$todo"
  sleep 1
done
  # echo $todo
# fi
